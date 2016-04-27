require "rails_helper"

RSpec.feature "Creación de un nuevo usuario desde el panel de administrador", :type => :feature do
  fixtures :users

  scenario "Creación exitosa del usuario" do
    visit "/login/"

		fill_in "user_email", :with => "test@mail3.com"
		fill_in "user_password", :with => "entrar02"
    click_button "Iniciar sesión"

    visit "/users/"

    click_button "Crear Usuario"

    within('#nuevoUsuario') do
      fill_in "user_email", :with => "result@test.com"
      fill_in "user_name", :with => "Artemio Gutierrez"
      fill_in "user_rut", :with => "18.730.159-9"
      fill_in "user_password", :with => "entrar03"
      fill_in "user_password_confirmation", :with => "entrar03"
      select "Alumno", :from => "user_user_type"
      click_button "Crear usuario"
    end
      expect(page).to have_content('Usuario creado exitosamente')
  end

end
