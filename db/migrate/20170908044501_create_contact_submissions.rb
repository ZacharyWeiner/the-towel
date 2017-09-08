class CreateContactSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_submissions do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
