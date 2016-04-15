require 'rails_helper'

RSpec.describe User, type: :model do
	it "Es válido con user_id, practice_id y plunk" do
		exercise = Exercise.new(
			user_id: 1,
			practice_id: 1,
			plunk: "http://plnkr.co/edit/b4lkrujvYTCcME7bjDyb?p=preview")
		expect(exercise).to be_valid
	end

	it "Es válido sin plunk" do
		exercise = Exercise.new(plunk: nil)
		exercise.valid?
		expect(exercise.errors[:plunk]).to include("no puede estar en blanco")
	end

	it "Es válido sin user_id" do
		exercise = Exercise.new(user_id: nil)
		exercise.valid?
		expect(exercise.errors[:user_id]).to include("no puede estar en blanco")
	end

	it "Es válido sin practice_id" do
		exercise = Exercise.new(practice_id: nil)
		exercise.valid?
		expect(exercise.errors[:practice_id]).to include("no puede estar en blanco")
	end
end