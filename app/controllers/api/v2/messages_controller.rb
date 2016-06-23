class Api::V2::MessagesController < API::V2::ApiController

  def create
    @chat = Chat.find(params[:id])
    @owner = User.find(@chat.user_id)
  	
    @message = Message.new(chat_id: params[:id], user_id: params[:user_id], body: params[:body])
  	if @message.save
      render json: @message
  		#redirect_to({controller: "chats", action: "show", id: params[:id]})
      @message.each do |m|
        Notifier.msgNotify(m.find(params[:user_id]), Chat.find(params[:id])).deliver_now
      end
      #User.find(params[:receiver_id]),
       #         Chat.find(params[:owner_id])
  	else
      head :unprocessable_entity
  		#flash[:danger] = "Problemas con las publicación del mensaje"
  	end

  end
end