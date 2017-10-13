class AddDescriptionToLodgings < ActiveRecord::Migration[5.1]
  def change
    add_column :lodgings, :description, :text
  end
end
