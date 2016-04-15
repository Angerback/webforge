class ChatsController < ApplicationController
	def index
		if current_user.user_type == "Alumno"
  			@chats = Chat.where(user_id:current_user.id)
  		else
  			@chats = Chat.all
  		end 
  		@messages = Hash.new
  		@authors = Hash.new
  		@owners = Hash.new
  		@chats.each do |chat|
  			@owners[chat.id] = User.find(chat.user_id)
  			@messages[chat.id] = Message.where(chat_id: chat.id).last
  			@authors[chat.id] = User.find(@messages[chat.id].user_id).name
  		end
	end

  	def show
	  	@chat = Chat.find(params[:id])
      @owner = User.find(@chat.user_id)
	  	@messages = Message.where(chat_id: params[:id])
	  	@authors = Hash.new
	  	@messages.each do |message|
	  		@authors[message.id] = User.find(message.user_id).name 
  		end 
	end
end
