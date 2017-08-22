class CreateScheduleItems < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_items do |t|
      t.references :cohort, foreign_key: true
      t.references :location, foreign_key: true
      t.date :arrival_date
      t.date :departure_date

      t.timestamps
    end
  end
end
