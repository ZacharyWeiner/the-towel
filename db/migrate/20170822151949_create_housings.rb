class CreateHousings < ActiveRecord::Migration[5.1]
  def change
    create_table :housings do |t|
      t.string :name
      t.integer :rooms
      t.decimal :bathrooms
      t.string :street_number
      t.references :location, foreign_key: true
      t.text :map
      t.string :street_name
      t.string :postal_code
      t.string :neighborhood
      t.text :other_details

      t.timestamps
    end
  end
end
