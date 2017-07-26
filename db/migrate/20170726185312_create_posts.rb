class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :cohort, foreign_key: true
      t.text :content
      t.references :actions, foreign_key: true

      t.timestamps
    end
  end
end
