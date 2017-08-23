class AddChatToLocations < ActiveRecord::Migration[5.1]
  def change
    add_reference :locations, :chat_room, foreign_key: true
  end
end
