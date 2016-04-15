class Composition < ActiveRecord::Base
	belongs_to :question
  	belongs_to :evaluation

  	validates :number, presence: true
  	# number is an integer which represent the question order in the evaluation
end
