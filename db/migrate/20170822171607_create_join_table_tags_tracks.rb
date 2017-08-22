class CreateJoinTableTagsTracks < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :tracks do |t|
      t.references :tags, foreign_key: true
      t.references :tracks, foreign_key: true
    end
  end
end
