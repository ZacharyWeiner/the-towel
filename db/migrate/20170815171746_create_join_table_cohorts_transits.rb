class CreateJoinTableCohortsTransits < ActiveRecord::Migration[5.1]
  def change
    create_join_table :cohorts, :transits do |t|
      t.references :cohort, foreign_key: true
      t.references :transit, foreign_key: true
    end
  end
end
