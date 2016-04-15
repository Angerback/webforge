class Example < ActiveRecord::Base
	belongs_to :heuristic

	validates :heuristic_id, presence: true	
	validates :description, presence: true
	validates :image, presence: true
end
