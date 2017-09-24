json.extract! rating, :id, :user_id, :rating, :note, :tags_id, :created_at, :updated_at
json.url rating_url(rating, format: :json)
