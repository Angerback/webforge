require "rails_helper"

RSpec.describe "home/index" do
	it "Comprobación de vínculos en Home" do
		render

		expect(rendered).to have_link 'Empieza aquí', href: "/introduction"

		expect(rendered).to have_link 'Heurísticas', href: "/heuristics"
		expect(rendered).to have_link 'Evaluación', href: "/evaluations"
		expect(rendered).to have_link 'Práctica', href: "/practices"
		#expect(rendered).to have_link 'Recursos', href: "#"		
	end
end