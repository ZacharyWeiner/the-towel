class AddLodgingToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :lodging, foreign_key: true
  end
end
