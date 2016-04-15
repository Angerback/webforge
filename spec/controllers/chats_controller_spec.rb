require 'rails_helper'

RSpec.describe ChatsController, type: :controller do
	fixtures :users, :chats, :messages

	before(:each) do
      	@user = User.find(1)
      	sign_in @user
    end

  	describe "GET #index" do
    	it "Carga exitosa de conversaciones" do
	      	get :index
	      	expect(response).to render_template(:index)
	    end
  	end

  	describe "GET #show" do
    	it "Carga exitosa de conversación" do
	      	get :show, id: 1
	     	expect(response).to render_template(:show)
	    end
  	end
end