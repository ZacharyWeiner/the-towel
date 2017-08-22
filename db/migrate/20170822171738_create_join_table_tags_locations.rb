class CreateJoinTableTagsLocations < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :locations do |t|
      t.references :tags, foreign_key: true
      t.references :locations, foreign_key: true
    end
  end
end
