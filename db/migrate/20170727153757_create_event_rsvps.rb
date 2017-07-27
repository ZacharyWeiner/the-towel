class CreateEventRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :event_rsvps do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
