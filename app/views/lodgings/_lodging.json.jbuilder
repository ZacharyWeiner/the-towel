json.extract! lodging, :id, :checkin_date, :checkin_time, :checkout_date, :checkout_time, :phone, :website, :address, :location_id, :map, :created_at, :updated_at
json.url lodging_url(lodging, format: :json)
