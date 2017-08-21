class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :cohort, foreign_key: true
      t.references :event, foreign_key: true
      t.references :location, foreign_key: true
      t.references :post, foreign_key: true
      t.text :picture
      t.string :caption

      t.timestamps
    end
  end
end
