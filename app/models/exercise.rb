class Exercise < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	belongs_to :practice

	validates :user_id, presence: true
	validates :practice_id, presence: true
	validates :plunk, presence: true
end
