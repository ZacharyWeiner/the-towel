class AddIsPublicToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_public, :boolean
  end
end
