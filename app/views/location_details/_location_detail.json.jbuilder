json.extract! location_detail, :id, :location_id, :image, :description, :created_at, :updated_at
json.url location_detail_url(location_detail, format: :json)
