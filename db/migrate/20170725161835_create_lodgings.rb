class CreateLodgings < ActiveRecord::Migration[5.1]
  def change
    create_table :lodgings do |t|
      t.string :name
      t.date :checkin_date
      t.time :checkin_time
      t.date :checkout_date
      t.time :checkout_time
      t.string :phone
      t.string :website
      t.string :address
      t.references :location, foreign_key: true
      t.text :map

      t.timestamps
    end
  end
end
