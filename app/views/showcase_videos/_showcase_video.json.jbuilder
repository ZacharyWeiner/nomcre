json.extract! showcase_video, :id, :file, :showcase_type, :show, :order, :title, :description, :thumbnail, :created_at, :updated_at
json.url showcase_video_url(showcase_video, format: :json)
