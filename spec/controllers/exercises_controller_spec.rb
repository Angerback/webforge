require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
	fixtures :users, :exercises

  before(:each) do
    @user = User.find(1)
    sign_in @user
  end

	describe "POST #create" do
  	it "Creación exitosa de ejercicio" do
    	post :create, id: 1, plunk: "http://plnkr.co/edit/b4lkrujvYTCcME7bjDyb?p=preview"
      expect(response).to redirect_to ({controller: "practices", action: "show", id: 1})
    end
	end

	describe "POST #update" do
  	it "Actualización exitosa de ejercicio" do
    	post :update, id: 1, plunk: "http://plnkr.co/edit/b4lkrujvYTCcME7bjDyb?p=preview"
      expect(response).to redirect_to ({controller: "practices", action: "show", id: 1})
    end
	end
end