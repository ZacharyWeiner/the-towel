class AddSideTripToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :side_trip, foreign_key: true
  end
end
