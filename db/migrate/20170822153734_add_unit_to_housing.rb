class AddUnitToHousing < ActiveRecord::Migration[5.1]
  def change
    add_column :housings, :unit, :string
  end
end
