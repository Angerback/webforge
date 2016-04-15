require "rails_helper"

RSpec.feature "Revisión de saldo", :type => :feature do
	fixtures :users, :bank_accounts

	scenario "Usuario revisa saldo", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		click_button "Depósito"

		fill_in "amount", :with => "1000"
		click_button "Depositar"

		click_button "metro-logout"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"

		click_button "Historial"
		expect(page).to have_text("Deposistaste: 1000 CLP en tu cuenta") 
	end
end