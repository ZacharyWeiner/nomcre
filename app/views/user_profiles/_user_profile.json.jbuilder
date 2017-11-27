json.extract! user_profile, :id, :display_name, :description, :shot_preference, :content_type, :profile_photo, :header_image, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
