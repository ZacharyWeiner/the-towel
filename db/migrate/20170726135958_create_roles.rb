class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :title
      t.integer :permissions

      t.timestamps
    end
  end
end
