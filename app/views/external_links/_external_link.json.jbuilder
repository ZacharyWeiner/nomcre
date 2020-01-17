json.extract! external_link, :id, :title, :url, :created_at, :updated_at
json.url external_link_url(external_link, format: :json)
