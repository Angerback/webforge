require "rails_helper"

RSpec.describe "evaluations/index" do
	fixtures :users, :tests, :answers

	it "Carga de evaluaciones con usuario anónimo" do
		assign(:evaluations, Evaluation.all)
		
		render

		expect(rendered).to have_content "Introducción a las Heurísticas de Nielsen"				
	end

	it "Carga de evaluaciones con usuario identificado" do
		@user = User.find(1)
     	sign_in @user	

     	@last_grade = Array.new
     	@continue = Array.new
     	@continue[1] = Test.find(1)

		assign(:evaluations, Evaluation.all)
		
		render

		expect(rendered).to have_content "Introducción a las Heurísticas de Nielsen"				
	end
end