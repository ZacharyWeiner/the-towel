class CreateRoomateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :roomate_requests do |t|
      t.bigint :requested_by
      t.bigint :requested

      t.timestamps
    end
  end
end
