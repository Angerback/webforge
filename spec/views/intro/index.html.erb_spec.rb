require "rails_helper"

RSpec.describe "intro/index" do
	it "Comprobación de vínculos en Intro" do
		render

		expect(rendered).to have_link 'Definición del Porcentaje de Rebote en Google Analytics (ESP, WEB)', href: "https://support.google.com/analytics/answer/1009409?hl=es"
		expect(rendered).to have_link 'Estudio acerca de la Tasa de Rebote en E-commerce y valor por transacción (ENG, WEB)', href: "http://www.wolfgangdigital.com/blog/digital-marketing/wolfgang-e-commerce-kpi-study-2014/"
		expect(rendered).to have_link '', href: "/heuristics"			
	end
end