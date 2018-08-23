json.extract! user_activity, :id, :activity_type, :user_id, :object_id, :created_at, :updated_at
json.url user_activity_url(user_activity, format: :json)
