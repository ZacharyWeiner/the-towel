class AddCohortIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :cohort, foreign_key: true
  end
end
