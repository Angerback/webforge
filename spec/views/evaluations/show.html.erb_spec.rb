require "rails_helper"

RSpec.describe "evaluations/show" do
	fixtures :users, :tests, :answers

	before(:each) do
		@user = User.find(1)
     	sign_in @user
     end

	it "Carga de evaluaciones con usuario anónimo" do
		@last_test = Test.where( :user_id => @user.id, 
  			                     :evaluation_id => 1 ).last

		@topics = Array.new
		@answers = Answer.where( :test_id => @last_test.id)
		@correct_answers = Answer.where( :test_id => @last_test.id,
			                             :correct => 1) 
		@last_test.grade = 1+ ( 0.3 * @correct_answers.length )

		render

		expect(rendered).to have_content "1,0"
	end

end