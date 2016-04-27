require "rails_helper"

RSpec.feature "Barra de busqueda de usuarios", :type => :feature do

  	fixtures :users

	scenario "Busqueda exitosa de un usuario" do

		visit "/login/"
		fill_in "user_email", :with => "test@mail3.com"
		fill_in "user_password", :with => "entrar02"
		click_button "Iniciar sesión"


		visit "/users/"
		fill_in "search", :with => "Obama"
		click_button "Buscar"

		within('#tabla_resultado') do

			expect(page).to have_content('Barack Obama')

		end
	end
end

	