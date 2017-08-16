class AddDescriptionToSideTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :side_trips, :description, :text
  end
end
