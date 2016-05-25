class Api::V2::MessagesController < API::V2::ApiController

  def create
    @chat = Chat.find(params[:id])
    @owner = User.find(@chat.user_id)
  	
    @message = Message.new(chat_id: params[:id], user_id: params[:user_id], body: params[:body])
  	if @message.save
      render json: @message
  		#redirect_to({controller: "chats", action: "show", id: params[:id]})
  	else
      head :unprocessable_entity
  		#flash[:danger] = "Problemas con las publicación del mensaje"
  	end

  end
end