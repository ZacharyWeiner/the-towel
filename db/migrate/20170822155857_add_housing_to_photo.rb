class AddHousingToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :housing_id, :bigint
  end
end
