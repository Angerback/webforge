class Reference < ActiveRecord::Base
	belongs_to :heuristic

	validates :link, presence: true
	validates :heuristic_id, presence: true
	validates :description, presence: true
end
