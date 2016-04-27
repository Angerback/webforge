class HomeController < ApplicationController
  
  #before_action :authenticate_user!
  

  #se agregó codigo a index y continue para poder hacer la logica y redireccion para continuar evaluación pasada  
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
