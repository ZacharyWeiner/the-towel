class AddChatToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :chat_room, foreign_key: true
  end
end
