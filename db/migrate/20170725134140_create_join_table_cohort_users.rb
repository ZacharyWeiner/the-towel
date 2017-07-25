class CreateJoinTableCohortUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :cohorts, :users do |t|
      t.references :cohort, foreign_key: true
      t.references :users, foreign_key: true
    end
  end
end
