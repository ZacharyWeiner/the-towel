json.extract! photo, :id, :cohort_id, :event_id, :city_id, :post_id, :picture, :caption, :created_at, :updated_at
json.url photo_url(photo, format: :json)
