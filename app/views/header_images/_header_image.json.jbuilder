json.extract! header_image, :id, :title, :file, :homepage, :showcase, :creators, :created_at, :updated_at
json.url header_image_url(header_image, format: :json)
