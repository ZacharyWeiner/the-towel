class CreateSideTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :side_trips do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :is_public
      t.bigint :creator_id

      t.timestamps
    end
  end
end
