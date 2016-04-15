require "rails_helper"

RSpec.describe "questions/show" do
	fixtures :users, :tests, :answers

	before(:each) do
		@user = User.find(1)
     	sign_in @user
     end

	it "Carga de evaluaciones con usuario anónimo" do
		@composition = Composition.find(1)
		@question = Question.find( @composition.question_id )
		@alternatives = Alternative.where( question_id: 1)
		@instructions = "Selecciona Verdadero o Falso"
		@last_test = Test.where( :user_id => @user.id, 
  			                     :evaluation_id => 1 ).last
		@progress = Answer.where( test_id: @last_test.id ).length * 5
		@action = "Continuar"

		render

		expect(rendered).to have_content "Las Heurísticas de Nielsen sólo se utilizan en la fase de diseño del ciclo de vida del software."
		expect(rendered).to have_content "5%"
		expect(rendered).to have_button "Continuar"
	end

end