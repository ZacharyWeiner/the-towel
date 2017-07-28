class CreateLocationDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :location_details do |t|
      t.references :location, foreign_key: true
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
