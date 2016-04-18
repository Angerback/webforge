require 'rails_helper'

RSpec.describe UsersController do
	fixtures :users

  before(:each) do
    @user = User.find(3)
    sign_in @user
  end

	describe "GET #index" do
  	it "Carga exitosa de usaurios" do
    	get :index
      expect(response).to render_template(:index)
    end
	end

  describe "GET #show" do
    it "Carga exitosa de un usuario" do
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "Carga exitosa de vista para la creación de un nuevo usuario" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "Carga exitosa de vista para la edición de un usuario" do
      get :edit, id: 1
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    it "Creación exitosa de usuario" do
      post :create, user: { name: "Jacinto", email: "a@z.com", rut: "8.464.946-5",
      user_type: "Alumno", password: "entrar05" }
    end
  end

  describe "PATCH or PUT #update" do
    it "Actualización exitosa de usuario" do
      put :update, id: 2, user: { name: "Vladimir" }
      expect(response).to redirect_to :user
    end
  end

  describe "DELETE #destroy" do
    it "Eliminación exitosa de usuario" do
      expect{
        delete :destroy, :id => 2
     }.to change(User, :count).by(-1)
    end
  end

end
