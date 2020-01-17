json.extract! video, :id, :type, :title, :file, :created_at, :updated_at
json.url video_url(video, format: :json)
