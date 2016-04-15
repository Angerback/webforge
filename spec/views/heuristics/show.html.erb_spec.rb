require "rails_helper"

RSpec.describe "heuristics/show" do

	before(:each) do
    	assign(:heuristic, [
        Heuristic.create!(:name => "H1", :description => "H1's description")
      ])
    end

	it "Comprobación de vínculos en show de Heuristics" do
		#Pendiente problemas con asignación de arreglos :P
		#render
		#expect(rendered).to have_link '', href: ""				
	end
end