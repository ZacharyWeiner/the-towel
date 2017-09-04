class MessagesController < ApplicationController
  def create
    #message = current_user.messages.create!(body: params[:message][:body], chat_room_id: params[:chat_room_id])
    message = Message.new(message_params)
    message.user = current_user
    message.chat_room_id = params[:chat_room_id]
    if message.save
      ActionCable.server.broadcast 'messages',
      message: message.body,
      user: message.user.email
    end
    redirect_to message.chat_room
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:body, :user_id, :chat_room_id)
  end
end
