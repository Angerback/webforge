require "rails_helper"

RSpec.feature "Revisión de saldo", :type => :feature do
	fixtures :users

	scenario "Navegando a través de los contenidos educativos del recurso" do
		visit "/login/"

		fill_in "user_email", :with => "test@mail2.com"
		fill_in "user_password", :with => "entrar01"
		click_button "Iniciar sesión"

		click_link "Evaluaciones"
		
		click_button "test1"

		#Pregunta 1
		choose('answer_alternative_2')	
		click_button "Continuar"

		#Pregunta 2
		expect(page).to have_text('5%')
		choose('answer_alternative_1')	
		click_button "Continuar"

		#Pregunta 3
		expect(page).to have_text('10%')
		choose('answer_alternative_2')	
		click_button "Continuar"

		#Pregunta 4
		expect(page).to have_text('15%')
		choose('answer_alternative_1')	
		click_button "Continuar"

		#Pregunta 5
		expect(page).to have_text('20%')
		choose('answer_alternative_2')	
		click_button "Continuar"

		#Pregunta 6
		expect(page).to have_text('25%')
		choose('answer_alternative_2')	
		click_button "Continuar"

		#Pregunta 7
		expect(page).to have_text('30%')
		choose('answer_alternative_2')	
		click_button "Continuar"

		#Pregunta 8
		expect(page).to have_text('35%')
		choose('answer_alternative_2')	
		click_button "Continuar"

		#Pregunta 9
		expect(page).to have_text('40%')
		choose('answer_alternative_1')
			click_button "Continuar"

		#Pregunta 10
		expect(page).to have_text('45%')
		choose('answer_alternative_1')	
		click_button "Continuar"

		#Pregunta 11
		expect(page).to have_text('50%')
		choose('answer_alternative_4')	
		click_button "Continuar"
		
		#Pregunta 12
		expect(page).to have_text('55%')
		choose('answer_alternative_7')	
		click_button "Continuar"
		
		#Pregunta 13
		expect(page).to have_text('60%')
		choose('answer_alternative_11')	
		click_button "Continuar"
		
		#Pregunta 14
		expect(page).to have_text('65%')
		choose('answer_alternative_12')	
		click_button "Continuar"
		
		#Pregunta 15
		expect(page).to have_text('70%')
		choose('answer_alternative_17')	
		click_button "Continuar"
		
		#Pregunta 16
		expect(page).to have_text('75%')
		choose('answer_alternative_19')	
		click_button "Continuar"
		
		#Pregunta 17
		expect(page).to have_text('80%')
		choose('answer_alternative_22')	
		click_button "Continuar"
		
		#Pregunta 18
		expect(page).to have_text('85%')
		choose('answer_alternative_24')	
		click_button "Continuar"
		
		#Pregunta 19
		expect(page).to have_text('90%')
		choose('answer_alternative_27')	
		click_button "Continuar"
		
		#Pregunta 20
		expect(page).to have_text('95%')
		choose('answer_alternative_32')
		
		#Resultados
		visit "/evaluations/1"
		expect(page).to have_text('100%')
		expect(page).to have_text('¡Felicidades! ¡Tu puntuación ha sido perfecta!')		
	end

end