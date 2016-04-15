require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
	fixtures :users, :chats, :messages

	before(:each) do
      	@user = User.find(1)
      	sign_in @user
    end

  	describe "GET #new" do
    	it "Carga exitosa de plantilla" do
	      	get :new, id: 1
	      	expect(response).to render_template(:new)
	    end
  	end

  	describe "POST #create" do
    	it "Carga exitosa de resultados" do
	      	post :create, id: 1, chat_id: 1, body: "<p>Hola Mundo</p>"                                                              
          expect(response).to redirect_to({ controller: "chats", action: "show", id: 1 })
	    end
  	end
end