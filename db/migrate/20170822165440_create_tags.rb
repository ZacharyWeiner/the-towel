class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :tag_type, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
