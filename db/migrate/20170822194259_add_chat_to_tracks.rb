class AddChatToTracks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tracks, :chat_room, foreign_key: true
  end
end
