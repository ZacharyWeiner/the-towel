json.extract! event, :id, :date, :start_time, :end_time, :title, :description, :cost, :capacity, :location_id, :meeting_point, :event_type, :created_at, :updated_at
json.url event_url(event, format: :json)
