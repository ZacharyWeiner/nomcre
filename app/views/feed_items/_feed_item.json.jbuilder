json.extract! feed_item, :id, :title, :description, :body, :created_at, :updated_at
json.url feed_item_url(feed_item, format: :json)
