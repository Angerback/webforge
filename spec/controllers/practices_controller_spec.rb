require 'rails_helper'

RSpec.describe PracticesController, type: :controller do
	fixtures :users, :chats, :exercises

  		before(:each) do
      	@user = User.find(1)
      	sign_in @user
    end

  	describe "GET #index" do
    	it "Carga exitosa de prácticas" do
	      	get :index
	      	expect(response).to render_template(:index)
	    end
  	end

  	describe "GET #show" do
    	it "Carga exitosa de inicio de práctica" do
	      	get :show, id: 1
	     	expect(response).to render_template(:show)
	    end
  	end
end