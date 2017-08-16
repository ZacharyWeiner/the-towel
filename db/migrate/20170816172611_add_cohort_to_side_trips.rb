class AddCohortToSideTrips < ActiveRecord::Migration[5.1]
  def change
    add_reference :side_trips, :cohort, foreign_key: true
  end
end
