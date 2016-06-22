class Comment < ActiveRecord::Base
	belongs_to :theme

	validates :contenido, presence: true
end
