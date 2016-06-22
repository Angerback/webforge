class Comment < ActiveRecord::Base
	belongs_to :theme
	belongs_to :comment

	validates :contenido, presence: true
end
