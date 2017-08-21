class AddTrackToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :track_id, :bigint
  end
end
