class AddChatToSideTrips < ActiveRecord::Migration[5.1]
  def change
    add_reference :side_trips, :chat_room, foreign_key: true
  end
end
