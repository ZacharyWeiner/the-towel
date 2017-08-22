json.extract! housing, :id, :name, :rooms, :bathrooms, :street_number, :location_id, :map, :street_name, :postal_code, :neighborhood, :other_details, :created_at, :updated_at
json.url housing_url(housing, format: :json)
