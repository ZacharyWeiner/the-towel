class CreateJoinTableTagsEvents < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :events do |t|
      t.references :tags, foreign_key: true
      t.references :events, foreign_key: true
    end
  end
end
