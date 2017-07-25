class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :activity_type
      t.string :user_id
      t.integer :model_id
      t.integer :cohort_id
      t.timestamps
    end
  end
end
