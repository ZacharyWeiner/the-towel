json.extract! company, :id, :name, :contact_name, :website, :phone_number, :contact_email, :whatsapp, :logo, :banner_image, :created_at, :updated_at
json.url company_url(company, format: :json)
