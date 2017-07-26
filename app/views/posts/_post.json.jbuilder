json.extract! post, :id, :user_id, :cohort_id, :content, :actions_id, :created_at, :updated_at
json.url post_url(post, format: :json)
