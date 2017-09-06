json.extract! announcement, :id, :title, :user_id, :content, :cohort_id, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
