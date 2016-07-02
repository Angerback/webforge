class Api::V2::ChatsController < API::V2::ApiController
	def index
      @chats = Chat.all
  		@messages = Hash.new
  		@authors = Hash.new
  		@owners = Hash.new
  		@chats.each do |chat|
  			@owners[chat.id] = User.find(chat.user_id)
  			@messages[chat.id] = Message.where(chat_id: chat.id).last
  			@authors[chat.id] = User.find(@messages[chat.id].user_id)
  		end
      rescue ActiveRecord::RecordNotFound
      head :not_found
	end

  	def show
	  	@chat = Chat.find(params[:id])
      @owner = User.find(@chat.user_id)
	  	@messages = Message.where(chat_id: params[:id])
	  	@authors = Hash.new

	  	@messages.each do |message|
	  		@authors[message.id] = User.find(message.user_id).name
  		end

  		rescue ActiveRecord::RecordNotFound
      	head :not_found
	end

	def user_chats
		@chats = Chat.where(user_id: params[:user_id])
		@messages = Hash.new
		@authors = Hash.new
		@owners = Hash.new
		@chats.each do |chat|
			@owners[chat.id] = User.find(chat.user_id)
			@messages[chat.id] = Message.where(chat_id: chat.id).last
			@authors[chat.id] = User.find(@messages[chat.id].user_id)
		end
		rescue ActiveRecord::RecordNotFound
		head :not_found
	end
end
