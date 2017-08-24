class AddChargeIdToEventRsvps < ActiveRecord::Migration[5.1]
  def change
    add_column :event_rsvps, :charge_id, :string
  end
end
