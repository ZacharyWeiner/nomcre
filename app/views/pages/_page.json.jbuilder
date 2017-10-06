json.extract! page, :id, :title, :content, :views, :created_at, :updated_at
json.url page_url(page, format: :json)
