class MessagesController < ApplicationController
  def create
    #message = current_user.messages.create!(body: params[:message][:body], chat_room_id: params[:chat_room_id])
    message = Message.new(message_params)
    message.user = current_user
    chat_room = ChatRoom.find(params[:chat_room_id])
    message.chat_room = chat_room
    if message.save
      ActionCable.server.broadcast 'messages',
      message: message.body,
      user: message.user.email
      chat_room.users.each do |user|
        unless user == current_user
          notification = Notification.where(user: user, notification_type: "Chat", notification_obeject_id: chat_room.id).first
          if notification.nil?
            Notification.create!(user: user, notification_type: "Chat", notification_obeject_id: chat_room.id, read: false )
          else
            notification.read = false
            notification.save
          end
        end
      end
    end
    redirect_to message.chat_room
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:body, :user_id, :chat_room_id)
  end
end
