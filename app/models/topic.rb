class Topic < ActiveRecord::Base
	
	has_many :questions
	
	validates :name, presence: true
	validates :path, presence: true
end
