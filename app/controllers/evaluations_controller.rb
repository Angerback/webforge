class EvaluationsController < ApplicationController

	before_action :authenticate_user!, only: [:show, :begin]	
  	
  	def index
		@evaluations = Evaluation.all
		@continue = Array.new
		@last_grade = Array.new
		if current_user
			@evaluations.each do |evaluation|
				@continue[evaluation.id] = false
				@last_test = Test.where( :user_id => current_user.id, 
  			                     		 :evaluation_id => evaluation.id ).last
				@last_grade[evaluation.id] = Test.where( :user_id => current_user.id, 
  			                     		  :evaluation_id => evaluation.id,
  			                      		  :grade =>  0.9..7.1 ).last
				if @last_test
					if Composition.where( :evaluation_id => evaluation.id ).length > 
					   Answer.where( :test_id => @last_test.id).length
					   @continue[evaluation.id] = true
					end
				end
			end
		end
	end

	def show
		@last_test = Test.where( :user_id => current_user.id, 
  			                     :evaluation_id => params[:evaluation_id] ).last

		@topics = Array.new
		@answers = Answer.where( :test_id => @last_test.id)
		@answers.each do |answer|
			@question = Question.find(answer.question_id)
			if answer.alternative == @question.answer
				answer.correct = 1
				answer.save
			else
				answer.correct = 0
				answer.save
				@topics[@question.topic_id] = Topic.find(@question.topic_id)
			end
		end
		@correct_answers = Answer.where( :test_id => @last_test.id,
			                             :correct => 1) 
		@last_test.grade = 1+ ( 0.3 * @correct_answers.length )
		@last_test.save 
		
  	end

  	def begin
  		@last_test = Test.where( :user_id => current_user.id, 
  			                     :evaluation_id => params[:evaluation_id] ).last
  		if @last_test
	  		if Answer.where( :test_id => @last_test.id ).length <
	  			Composition.where(:evaluation => params[:evaluation_id] ).length
	  			@last_test.destroy
	  		end
	  	end 

  		@test = Test.new(user_id: current_user.id, evaluation_id: params[:evaluation_id])
  		
  		if @test.save
	  		redirect_to({ :action => "show", 
	  			          :controller => "questions", 
	  			          :evaluation_id => params[:evaluation_id],
	  			          :question_id => 1 })
	  	end
  	end

  	def continue
  		@last_test = Test.where( :user_id => current_user.id, 
  			                     :evaluation_id => params[:evaluation_id] ).last
  		@answers = Answer.where( :test_id => @last_test.id )
  		redirect_to({ :action => "show", 
  			          :controller => "questions", 
  			          :evaluation_id => params[:evaluation_id],
  			          :question_id => ( @answers.length.to_i + 1 )})
  	end
end
