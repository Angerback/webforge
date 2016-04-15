require "rails_helper"

RSpec.describe "heuristic_evaluations/index" do
	it "Comprobación de vínculos en Heuristic_Evaluations" do
		render

		expect(rendered).to have_link 'Memoria que habla acerca de la Evaluación Heurística (ESP, PDF)', href: "http://www.issi.uned.es/CalidadSoftware/Noticias/PFC_2.pdf"		
		expect(rendered).to have_link 'Evaluación Heurística y Lista de comprobación de ítems de D. Pierotti (ESP, PDF)', href: "http://aipo.es/libro/pdf/15-Evaluacion-Heuristica.pdf"		
	end
end