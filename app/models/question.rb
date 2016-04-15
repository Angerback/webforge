class Question < ActiveRecord::Base
	
	has_many :answers

	has_many :alternatives
	
	has_many :compositions
  	has_many :evaluations, through: :compositions

	validates :topic_id, presence: true
	validates :sentence, presence: true
	validates :question_type, presence: true
	#answer is an integer which contain the id of the right alternative
end
