class AddPaidAndNotesToEventRsvps < ActiveRecord::Migration[5.1]
  def change
    add_column :event_rsvps, :is_paid, :boolean
    add_column :event_rsvps, :notes, :text
  end
end
