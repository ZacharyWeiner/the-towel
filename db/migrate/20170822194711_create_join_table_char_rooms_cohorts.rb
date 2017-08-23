class CreateJoinTableCharRoomsCohorts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :cohorts, :chat_rooms do |t|
      t.references :cohort, foreign_key: true
      t.references :chat_room, foreign_key: true
    end
  end
end
