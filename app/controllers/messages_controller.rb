class MessagesController < ApplicationController
  def create
    current_user.messages.create!(body: params[:message][:body], chat_room_id: params[:chat_room_id])
    redirect_to chat_room_path(ChatRoom.find(params[:chat_room_id]))
  end
end
