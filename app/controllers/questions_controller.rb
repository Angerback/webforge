class QuestionsController < ApplicationController
  	before_action :authenticate_user!

  	def show
	  	@composition = Composition.find_by( number: params[:question_id], 
	  		                                evaluation_id: params[:evaluation_id])
	    @question = Question.find( @composition.question_id )
	    if @question.question_type == "VF"
	    	@alternatives = Alternative.where( question_id: 1)
	    	@instructions = "Selecciona Verdadero o Falso"
	    else
	    	@alternatives = Alternative.where( question_id: @question.id)
	    	if @question.question_type == "Selección múltiple"
	    		@instructions = "Selecciona la alternativa correcta"
	    	end
	    	if @question.question_type == "Palabra faltante"
	    		@instructions = "Selecciona el concepto más apropiado"
	    	end
	    end
	    
	    @last_test = Test.where( :user_id => current_user.id, 
  			                     :evaluation_id => params[:evaluation_id] ).last
	    
	    @progress = Answer.where( test_id: @last_test.id ).length * 5
	    
	    if Answer.where( test_id: @last_test.id ).length == 
	    	Composition.where(evaluation_id: params[:evaluation_id]).length - 1
	    	@action = "Calificar"
	    else
	    	@action = "Continuar"
	    end    
  	end

  	def go
  		@last_test = Test.where( :user_id => current_user.id, 
  			                     :evaluation_id => params[:evaluation_id] ).last
	  	if params[:answer]
	  		@answer = Answer.new( test_id: @last_test.id, 
	  					          question_id: (params[:question_id].to_i - 1),
	  					          alternative: params[:answer][:alternative])
	  		if @answer.save
	  			if Composition.where( evaluation_id: params[:evaluation_id] ).length ==
	  			Answer.where( test_id: @last_test.id ).length
	  				redirect_to({ :action => "show",
	  							  :controller => "evaluations",
	  							  :evaluation_id => params[:evaluation_id]})
	  			else
	  				redirect_to({ :action => "show", 
			  			          :controller => "questions", 
			  			          :evaluation_id => params[:evaluation_id],
			  			          :question_id => params[:question_id]})
			  	end 
	  		end	
	  	end
  	end
end
