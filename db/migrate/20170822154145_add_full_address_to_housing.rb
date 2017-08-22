class AddFullAddressToHousing < ActiveRecord::Migration[5.1]
  def change
    add_column :housings, :full_address, :string
  end
end
