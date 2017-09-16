class AddSideTripToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :side_trip_id, :bigint
  end
end
