class CreateJoinTableTagsSideTrips < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :side_trips do |t|
      t.references :tags, foreign_key: true
      t.references :side_trips, foreign_key: true
    end
  end
end
