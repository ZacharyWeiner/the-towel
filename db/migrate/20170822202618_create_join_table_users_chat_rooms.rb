class CreateJoinTableUsersChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :chat_rooms do |t|
      t.references :users, foreign_key: true
      t.references :chat_rooms, foreign_key: true
    end
  end
end
