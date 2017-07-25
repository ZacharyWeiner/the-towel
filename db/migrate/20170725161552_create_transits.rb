class CreateTransits < ActiveRecord::Migration[5.1]
  def change
    create_table :transits do |t|
      t.date :date
      t.time :departure_time
      t.string :title
      t.string :travel_type
      t.references :company, foreign_key: true
      t.string :route_number
      t.references :departure_location
      t.text :departure_map
      t.references :arrival_location
      t.time :arrival_time

      t.timestamps
    end
  end
end
