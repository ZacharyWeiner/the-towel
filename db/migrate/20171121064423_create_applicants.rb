class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :facebook
      t.string :linkedin
      t.string :instagram
      t.string :job_title
      t.string :company_name
      t.boolean :is_remote
      t.text :description
      t.text :why_me
      t.string :current_city
      t.boolean :is_traveling
      t.text :best_travel_experience
      t.integer :years_in_profession
      t.string :contact_method
      t.string :whatsapp
      t.string :favorite_country
      t.string :favorite_city
      t.text :best_project

      t.timestamps
    end
  end
end
