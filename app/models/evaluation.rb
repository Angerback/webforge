class Evaluation < ActiveRecord::Base

	has_many :tests

	has_many :compositions
  	has_many :questions, through: :compositions

	validates :name, presence: true
	validates :description, presence: true 
end
