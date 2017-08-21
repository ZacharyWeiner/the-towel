class AddSideTripsToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :side_trip, foreign_key: true
  end
end
