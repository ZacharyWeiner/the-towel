class ChatRoomsController < ApplicationController
  layout 'chat'
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
    unless @chat_room.users.include?(current_user)
      current_user.chat_rooms << @chat_room
    end
    notification = Notification.where(notification_type: "Chat", notification_obeject_id: @chat_room.id, user: current_user).first
    unless notification.nil?
      notification.read = true
      notification.save
    end
  end

  def leave_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chat_room.users.destroy(current_user)
    redirect_to chat_rooms_path
  end

  private
  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
