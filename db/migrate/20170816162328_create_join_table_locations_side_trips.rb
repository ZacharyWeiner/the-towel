class CreateJoinTableLocationsSideTrips < ActiveRecord::Migration[5.1]
  def change
    create_join_table :locations, :side_trips do |t|
      t.references :location, foreign_key: true
      t.references :side_trip, foreign_key: true
    end
  end
end
