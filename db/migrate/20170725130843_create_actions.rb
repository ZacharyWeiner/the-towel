class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.string :action_type
      t.string :user_id
      t.integer :model_id
      t.integer :cohort_id
      t.timestamps
    end
  end 
end
