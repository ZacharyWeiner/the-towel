class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.text :description
      t.references :events, foreign_key: true
      t.references :location, foreign_key: true
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
