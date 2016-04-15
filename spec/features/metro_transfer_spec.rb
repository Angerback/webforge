require "rails_helper"

RSpec.feature "Transferir saldo", :type => :feature do
	fixtures :users, :bank_accounts

	scenario "Usuario transfiere fondos exitosamente", :js => true do
		visit "/metro"

		fill_in "rut", :with => "11.685.558-5"
		fill_in "password", :with => "entrar01"
		click_button "login"

		click_button "Transferencia"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "amount", :with => "500"
		
		click_button "Transferir fondos"

		expect(page).to have_text("Transferencia realizada exitosamente")
		expect(page).to have_text("$500 en su cuenta")

		click_button "metro-logout"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"

		expect(page).to have_text("$500") 
	end

	scenario "Usuario ingresa rut erroneo", :js => true do
		visit "/metro"

		fill_in "rut", :with => "11.685.558-5"
		fill_in "password", :with => "entrar01"
		click_button "login"

		click_button "Transferencia"

		fill_in "rut", :with => "20.356.594"
		fill_in "amount", :with => "500"
		
		click_button "Transferir fondos"

		expect(page).to have_text("El rut ingresado no es válido") 
	end

	scenario "Usuario ingresa monto superior a su saldo", :js => true do
		visit "/metro"

		fill_in "rut", :with => "11.685.558-5"
		fill_in "password", :with => "entrar01"
		click_button "login"

		click_button "Transferencia"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "amount", :with => "1001"
		
		click_button "Transferir fondos"

		expect(page).to have_text("No dispones de fondos suficientes") 
	end

	scenario "Usuario no ingresa monto a Transferir", :js => true do
		visit "/metro"

		fill_in "rut", :with => "11.685.558-5"
		fill_in "password", :with => "entrar01"
		click_button "login"

		click_button "Transferencia"

		fill_in "rut", :with => "20.356.594-1"
		
		click_button "Transferir fondos"

		expect(page).to have_text("Escribe el monto a transferir") 
	end
end