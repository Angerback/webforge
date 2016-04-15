require 'rails_helper'

RSpec.describe HeuristicEvaluationsController, type: :controller do

  describe "GET #index" do
    it "Carga exitosa de plantilla" do
      get :index
      expect(response).to render_template(:index)
    end
  end
  
end
