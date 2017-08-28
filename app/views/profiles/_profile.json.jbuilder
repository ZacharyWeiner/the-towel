json.extract! profile, :id, :user_id, :display_name, :hometown, :phone_number, :whatsapp, :facebook, :instagram, :birthday, :website, :snapchat, :bio, :created_at, :updated_at
json.url profile_url(profile, format: :json)
