class Api::V2::MessagesController < API::V2::ApiController

  def create
    @chat = Chat.find(params[:id])
    @emails = Chat.all
    @owner = User.find(@chat.user_id)
    @message = Message.new(chat_id: params[:id], user_id: params[:user_id], body: params[:body])
    @messages = Message.where(chat_id: params[:id])

  	if @message.save
      render json: @message
  		#redirect_to({controller: "chats", action: "show", id: params[:id]})

      #lista de correos de los participantes del chat sin repetición
      emails = @messages.map {|message| User.find(message.user_id).email}
      Notifier.msgNotify(emails.uniq, @chat.title, @message.body).deliver_now

      #@messages.each do |messages|
        #puts messages.name
        #Notifier.msgNotify(messages, )
      #end
  	else
      head :unprocessable_entity
  		#flash[:danger] = "Problemas con las publicación del mensaje"
  	end

  end
end
