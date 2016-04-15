require "rails_helper"

RSpec.feature "Bloquear cuenta", :type => :feature do
	fixtures :users, :bank_accounts

	scenario "Usuario bloquea su cuenta", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		click_button "metro-opt"
		click_button "Bloquear cuenta"
		expect(page).to have_text("Cuenta bloqueada")

		click_button "metro-back"

		click_button "Depósito"

		fill_in "amount", :with => "1000"
		click_button "Depositar"
		
		expect(page).to have_text("Imposible realizar la operación. Tu cuenta esta bloqueada")		 
	end
end