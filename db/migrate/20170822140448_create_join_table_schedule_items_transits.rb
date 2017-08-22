class CreateJoinTableScheduleItemsTransits < ActiveRecord::Migration[5.1]
  def change
    create_join_table :schedule_items, :transits do |t|
      t.references :schedule_item, foreign_key: true
      t.references :transit, foreign_key: true
    end
  end
end
