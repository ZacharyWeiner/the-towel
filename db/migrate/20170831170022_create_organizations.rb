class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :logo
      t.text :description
      t.string :phone

      t.timestamps
    end
  end
end
