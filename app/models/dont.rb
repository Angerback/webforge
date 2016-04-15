class Dont < ActiveRecord::Base
	belongs_to :heuristic

	validates :heuristic_id, presence: true	
	validates :description, presence: true
end
