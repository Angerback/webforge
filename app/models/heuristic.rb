class Heuristic < ActiveRecord::Base
	has_many :examples
	has_many :references
	has_many :dos
	has_many :donts

	validates :name, presence: true	
	validates :description, presence: true
end
