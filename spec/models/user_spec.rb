require 'rails_helper'

RSpec.describe User, type: :model do
	it "Es válido con email, rut, name, password, password_confirmation, admin, user_type" do
		user = User.new(
			admin: false,
			email: 'test@example.com',
			name: 'myName',
			password: 'myPassword',
			password_confirmation: 'myPassword', 
			rut: '15.843.710-4',
			user_type: 'Alumno')
		expect(user).to be_valid
	end

	it "Es válido sin nombre" do
		user = User.new(name: nil)
   		user.valid?
	   	expect(user.errors[:name]).to include("no puede estar en blanco")
	end

	it "Es válido sin rut" do
		user = User.new(rut: nil)
   		user.valid?
	   	expect(user.errors[:rut]).to include("no puede estar en blanco")
	end

	it "Es válido con rut repetido" do
		User.create(admin: false,
			email: 'test@example.com',
			name: 'myName',
			password: 'myPassword',
			password_confirmation: 'myPassword', 
			rut: '15.843.710-4',
			user_type: 'Alumno')
		user = User.new(rut: '15.843.710-4')
		user.valid?
		expect(user.errors[:rut]).to include("ya está en uso")

	end

	it "Es válido con rut aleatoreo" do
		user = User.new(rut: "123")
   		user.valid?
	   	expect(user.errors[:rut]).to include("inválido")
	end

	it "Es válido sin email" do
		user = User.new(email: nil)
   		user.valid?
	   	expect(user.errors[:email]).to include("no puede estar en blanco")
	end

	it "Es válido con email repetido" do
		User.create(admin: false,
			email: 'test@example.com',
			name: 'myName',
			password: 'myPassword',
			password_confirmation: 'myPassword', 
			rut: '15.843.710-4',
			user_type: 'Alumno')
		user = User.new(email: 'test@example.com')
		user.valid?
		expect(user.errors[:email]).to include("ya está en uso")
	end	

	it "Es válido sin user_type" do
		user = User.new(user_type: nil)
   		user.valid?
	   	expect(user.errors[:user_type]).to include("no puede estar en blanco")
	end 
end