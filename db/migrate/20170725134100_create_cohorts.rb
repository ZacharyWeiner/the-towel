class CreateCohorts < ActiveRecord::Migration[5.1]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.text :banner_image
      t.text :image

      t.timestamps
    end
  end
end
