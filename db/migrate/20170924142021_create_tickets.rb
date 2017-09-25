class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.bigint :created_by
      t.bigint :assigned_to
      t.string :status
      t.text :details
      t.text :resolution
      t.date :resolved_on
      t.string :title
      t.bigint :resolved_by

      t.timestamps
    end
  end
end
