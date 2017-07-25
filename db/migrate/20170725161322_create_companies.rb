class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :contact_name
      t.string :website
      t.string :phone_number
      t.string :contact_email
      t.boolean :whatsapp
      t.text :logo
      t.text :banner_image

      t.timestamps
    end
  end
end
