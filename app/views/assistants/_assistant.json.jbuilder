json.extract! assistant, :id, :name, :paypal_email, :phone, :rate, :assistant_type, :location_id, :created_at, :updated_at
json.url assistant_url(assistant, format: :json)
