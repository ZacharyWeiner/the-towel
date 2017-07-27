json.extract! event_rsvp, :id, :event_id, :user_id, :note, :created_at, :updated_at
json.url event_rsvp_url(event_rsvp, format: :json)
