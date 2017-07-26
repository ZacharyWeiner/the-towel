class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :height
      t.integer :weight
      t.string :email
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
