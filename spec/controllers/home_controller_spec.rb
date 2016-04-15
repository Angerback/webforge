require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "Carga exitosa de plantilla" do
      get :index
      expect(response).to render_template(:index)
    end
  end
  
end