require "rails_helper"

RSpec.feature "Revisión de saldo", :type => :feature do
	fixtures :users, :bank_accounts

	scenario "Usuario revisa saldo", :js => true do
		visit "/metro"

		fill_in "rut", :with => "20.356.594-1"
		fill_in "password", :with => "entrar00"
		click_button "login"
		
		expect(page).to have_text("$0") 
	end
end