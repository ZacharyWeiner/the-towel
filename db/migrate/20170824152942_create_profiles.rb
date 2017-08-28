class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :display_name
      t.string :hometown
      t.string :phone_number
      t.boolean :whatsapp
      t.string :facebook
      t.string :instagram
      t.date :birthday
      t.string :website
      t.string :snapchat
      t.text :bio

      t.timestamps
    end
  end
end
