json.extract! applicant, :id, :name, :email, :phone, :facebook, :linkedin, :instagram, :job_title, :company_name, :is_remote, :description, :why_me, :current_city, :is_traveling, :best_travel_experience, :years_in_profession, :contact_method, :whatsapp, :favorite_country, :favorite_city, :best_project, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
