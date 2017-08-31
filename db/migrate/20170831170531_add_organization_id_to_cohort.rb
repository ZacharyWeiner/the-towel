class AddOrganizationIdToCohort < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :organization_id, :bigint
  end
end
