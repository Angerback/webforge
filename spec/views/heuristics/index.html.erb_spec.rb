require "rails_helper"

RSpec.describe "heuristics/index" do

	before(:each) do
      assign(:heuristics, [
        Heuristic.create!(:name => "H1", :description => "H1's description"),
        Heuristic.create!(:name => "H2", :description => "H2's description")
      ])
    end

	it "Comprobación de vínculos en el Index de Heuristics" do
		render

		expect(rendered).to have_link 'H1', href: "/heuristics/1"
		expect(rendered).to have_link 'H2', href: "/heuristics/2"

		expect(rendered).to have_link 'Heuŕisticas de Nielsen (ENG, WEB)', href: "http://www.nngroup.com/articles/ten-usability-heuristics/"
		expect(rendered).to have_link 'Ejemplos de las 10 Heurísticas (ENG, WEB)', href: "http://designingwebinterfaces.com/6-tips-for-a-great-flex-ux-part-5"
		expect(rendered).to have_link 'Evaluación Heurística y Lista de comprobación de ítems de D. Pierotti (ESP, PDF)', href: "http://aipo.es/libro/pdf/15-Evaluacion-Heuristica.pdf"				
	end
end