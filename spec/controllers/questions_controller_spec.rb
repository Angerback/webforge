require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	fixtures :users, :tests, :answers

  before(:each) do
    @user = User.find(1)
    sign_in @user
  end

	describe "GET #show" do
  	it "Carga exitosa de pregunta" do
    	get :show, evaluation_id: 1, question_id: 2
    	expect(response).to render_template(:show)
    end
	end

	describe "POST #go" do
  	it "Redirección exitosa a siguiente pregunta" do
    	post :go, evaluation_id: 1, question_id: 3, answer: { id: 2, test_id: 2, question_id: 2, 
        alternative: 1 }
     	expect(response).to redirect_to({ :action => "show", 
                        :controller => "questions", 
                        :evaluation_id => 1,
                        :question_id => 3})
    end
	end
end