json.extract! transit, :id, :date, :departure_time, :title, :travel_type, :company_id, :route_number, :departure_location_id, :departure_map, :arrival_location_id, :arrival_time, :created_at, :updated_at
json.url transit_url(transit, format: :json)
