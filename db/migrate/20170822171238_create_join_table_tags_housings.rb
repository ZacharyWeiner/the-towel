class CreateJoinTableTagsHousings < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :housings do |t|
      t.references :tags, foreign_key: true
      t.references :housings, foreign_key: true
    end
  end
end
