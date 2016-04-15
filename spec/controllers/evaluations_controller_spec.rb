require 'rails_helper'

RSpec.describe EvaluationsController, type: :controller do
	fixtures :users, :tests, :answers

	before(:each) do
      	@user = User.find(1)
      	sign_in @user
    end

  	describe "GET #index" do
    	it "Carga exitosa de plantilla" do
	      	get :index
	      	expect(response).to render_template(:index)
	    end
  	end

  	describe "GET #show" do
    	it "Carga exitosa de resultados" do
	      	get :show, evaluation_id: 1
	     	expect(response).to render_template(:show)
	    end
  	end

  	describe "GET #begin" do
    	it "Comienzo de evaluación" do
	      	get :begin, evaluation_id: 1
	      	expect(response).to redirect_to({ :action => "show", 
	  			          :controller => "questions", 
	  			          :evaluation_id => 1,
	  			          :question_id => 1 })
	    end
  	end
  
 	describe "GET #continue" do
    	it "Continuar evaluación" do
	      	get :continue, evaluation_id: 1
	      	expect(response).to redirect_to({ :action => "show", 
	  			          :controller => "questions", 
	  			          :evaluation_id => 1,
	  			          :question_id => 2 })
	    end
  	end 
end