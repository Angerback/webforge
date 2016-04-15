require "rails_helper"

RSpec.feature "Inicio de sesión", :type => :feature do
	fixtures :users, :bank_accounts

	scenario "Usuario inicia sesión exitosamente", :js => true do		
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		expect(page).to have_text("Juanito")
		
		click_button "metro-logout" 
	end

	scenario "Usuario ingresa un rut inválido", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		expect(page).to have_text("El rut ingresado no es válido")
	end

	scenario "Usuario ingresa una contraseña incorrecta", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar"
		click_button "login"
		
		expect(page).to have_text("La contraseña es incorrecta. Asegúrate de usar la contraseña de tu cuenta")
	end
end