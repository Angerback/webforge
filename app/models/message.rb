class Message < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	belongs_to :chat, dependent: :destroy

	validates :body, presence: true
	validates :user_id, presence: true
	validates :chat_id, presence: true	
end
