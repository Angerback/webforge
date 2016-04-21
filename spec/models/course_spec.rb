require 'rails_helper'

RSpec.describe Course, type: :model do
  it "Es válido con name, semester" do
		course = Course.new(
			name: 'Curso nuevo',
      semester: 1)
		expect(course).to be_valid
	end

  it "Los objetos con sus relaciones se mantienen en caso de asociacion" do
		course = Course.new(
			name: 'Curso nuevo',
      semester: 1)

    user = User.new(
			admin: false,
			email: 'test@example.com',
			name: 'myName',
			password: 'myPassword',
			password_confirmation: 'myPassword',
			rut: '15.843.710-4',
			user_type: 'Alumno')

    user.save
    user.user_courses.create(course: course)
		expect(course.users.first.name).to eq(user.name)
    user.destroy
    course.destroy
	end
end
