class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :title
      t.text :description
      t.integer :cost
      t.integer :capacity
      t.references :location, foreign_key: true
      t.text :meeting_point
      t.string :event_type

      t.timestamps
    end
  end
end
