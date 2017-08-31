class AddOrganizationIdToLocationDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :location_details, :organization_id, :bigint
  end
end
