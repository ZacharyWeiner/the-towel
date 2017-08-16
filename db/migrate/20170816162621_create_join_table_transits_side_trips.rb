class CreateJoinTableTransitsSideTrips < ActiveRecord::Migration[5.1]
  def change
    create_join_table :transits, :side_trips do |t|
      t.references :transit, foreign_key: true
      t.references :side_trip, foreign_key: true
    end
  end
end
