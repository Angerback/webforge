require "rails_helper"

RSpec.feature "Depósito", :type => :feature do
	fixtures :users, :bank_accounts

	scenario "Usuario realiza depósito exitosamente", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		click_button "Depósito"

		fill_in "amount", :with => "1000"
		click_button "Depositar"

		expect(page).to have_text("$1.000 en su cuenta")
	end

	scenario "Usuario no ingresa monto", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		click_button "Depósito"

		click_button "Depositar"

		expect(page).to have_text("Escribe el monto a depositar")
	end

	scenario "Usuario ingresa un monto igual a 0", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		click_button "Depósito"

		fill_in "amount", :with => "0"
		click_button "Depositar"

		expect(page).to have_text("Escribe un monto mayor a 0")
	end

	scenario "Usuario ingresa un monto mayor o igual a 1.000.000.000", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		click_button "Depósito"

		fill_in "amount", :with => "1.000.000.000"
		click_button "Depositar"

		expect(page).to have_text("Escribe un monto menor a 1.000.000.000")
	end
end