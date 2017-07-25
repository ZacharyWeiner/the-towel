class CreateJoinTableEventsUsers < ActiveRecord::Migration[5.1]
 create_join_table :events, :users do |t|
      t.references :event, foreign_key: true
      t.references :users, foreign_key: true
      t.boolean :paid 
      t.text :notes 
    end
end
