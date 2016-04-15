require "rails_helper"

RSpec.feature "Retiro de fondos", :type => :feature do
	fixtures :users, :bank_accounts

	scenario "Usuario retira saldo exitosamente", :js => true do
		visit "/metro"

		fill_in "rut", :with => "11.685.558-5"
		fill_in "password", :with => "entrar01"
		click_button "login"

		click_button "Retiro"

		fill_in "amount", :with => "500"
		click_button "Retirar"

		expect(page).to have_text("Retiro realizado exitosamente")
		expect(page).to have_text("$500 en su cuenta") 
	end

	scenario "Usuario intenta retirar 0", :js => true do
		visit "/metro"

		fill_in "rut", :with => "11.685.558-5"
		fill_in "password", :with => "entrar01"
		click_button "login"

		click_button "Retiro"

		fill_in "amount", :with => "0"
		click_button "Retirar"

		expect(page).to have_text("Escribe un monto mayor a 0") 
	end

	scenario "Usuario no indica cifra a retirar", :js => true do
		visit "/metro"

		fill_in "rut", :with => "11.685.558-5"
		fill_in "password", :with => "entrar01"
		click_button "login"

		click_button "Retiro"

		click_button "Retirar"

		expect(page).to have_text("Escribe el monto a retirar") 
	end

	scenario "Usuario intenta retirar una cifra mayor a sus fondos", :js => true do
		visit "/metro"

		fill_in "rut", :with => "11.685.558-5"
		fill_in "password", :with => "entrar01"
		click_button "login"

		click_button "Retiro"

		fill_in "amount", :with => "10000"
		click_button "Retirar"

		expect(page).to have_text("No dispones de fondos suficientes") 
	end
end