class MessagesController < ApplicationController
  def new
    @chat = Chat.find(params[:id])
    @owner = User.find(@chat.user_id)
  end

  def create
  	@message = Message.new(chat_id: params[:id], user_id: current_user.id, body: params[:body])
  	if @message.save
  		redirect_to({controller: "chats", action: "show", id: params[:id]})
  	else
  		flash[:danger] = "Problemas con las publicación del mensaje"
  	end

  end
end
