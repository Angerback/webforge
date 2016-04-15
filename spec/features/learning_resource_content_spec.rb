require "rails_helper"

RSpec.feature "Revisión de saldo", :type => :feature do

	scenario "Navegando a través de los contenidos educativos del recurso" do
		visit root_path

		click_link "Empieza aquí!"

		expect(page).to have_text('Introducción')
		click_link("next")

		expect(page).to have_text('Heurísticas de Nielsen')
		click_link("next")

		expect(page).to have_text('H1: Visibilidad del Estado del Sistema')
		click_link("next")

		expect(page).to have_text('H2: Correspondencia entre el sistema y el mundo real')
		click_link("next")

		expect(page).to have_text('H3: Control y libertad para el Usuario')
		click_link("next")

		expect(page).to have_text('H4: Consistencia y Estándares')
		click_link("next")

		expect(page).to have_text('H5: Prevención de Errores')
		click_link("next")

		expect(page).to have_text('H6: Reconocer antes que Recordar')
		click_link("next")

		expect(page).to have_text('H7: Flexibilidad y eficiencia de uso')
		click_link("next")

		expect(page).to have_text('H8: Estética de diálogos y Diseño minimalista')
		click_link("next")

		expect(page).to have_text('H9: Ayuda a los Usuarios en el Reconocimiento, Diagnóstico y Recuperación de Errores')
		click_link("next")

		expect(page).to have_text('H10: Ayuda y Documentación')
		click_link("next")

		expect(page).to have_text('Evaluación Heurística')
	end

end