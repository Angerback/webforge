require 'rails_helper'

RSpec.describe HeuristicsController, type: :controller do

  describe "GET #index" do
    it "Carga exitosa de plantilla" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "Carga exitosa de plantilla" do
      heuristic = Heuristic.create(name: "Heurística de prueba", 
                                   description: "Probando método show")
      get :show, heuristic_id: heuristic.id
      expect(response).to render_template(:show)
    end
  end

end
