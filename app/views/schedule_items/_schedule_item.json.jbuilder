json.extract! schedule_item, :id, :cohort_id, :location_id, :arrival_date, :departure_date, :created_at, :updated_at
json.url schedule_item_url(schedule_item, format: :json)
