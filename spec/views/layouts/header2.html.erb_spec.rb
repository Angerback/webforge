require "rails_helper"

RSpec.describe "layouts/header2" do
	fixtures :users
	
	it "carga enlances en cabecera" do
		@user = User.find(1)
     	sign_in @user

		render :partial => "layouts/header2.html.erb"
		
		expect(rendered).to have_link 'Introducción', href: "/heuristics"
		expect(rendered).to have_link 'H1: Visibilidad del Estado del Sistema', href: "/heuristics/1"
		expect(rendered).to have_link 'H2: Correspondencia entre el Sistema y el Mundo Real', href: "/heuristics/2"
		expect(rendered).to have_link 'H3: Control y Libertad', href: "/heuristics/3"
		expect(rendered).to have_link 'H4: Consistencia y Estándares', href: "/heuristics/4"
		expect(rendered).to have_link 'H5: Prevención de Errores', href: "/heuristics/5"
		expect(rendered).to have_link 'H6: Reconocer antes que Recordar', href: "/heuristics/6"
		expect(rendered).to have_link 'H7: Flexibilidad y Eficiencia de Uso', href: "/heuristics/7"
		expect(rendered).to have_link 'H8: Estética de Diálogos y Diseño Minimalista', href: "/heuristics/8"
		expect(rendered).to have_link 'H9: Ayuda a los Usuarios ante Errores', href: "/heuristics/9"
		expect(rendered).to have_link 'H10: Ayuda y Documentación', href: "/heuristics/10"
		expect(rendered).to have_link 'Evaluación Heurística', href: "/heuristic_evaluation"

		expect(rendered).to have_link 'Evaluaciones', href: "/evaluations"
		expect(rendered).to have_link 'Módulo de Práctica', href: "/practices"
		#expect(rendered).to have_link 'Recursos', href: "#"		
	end

end