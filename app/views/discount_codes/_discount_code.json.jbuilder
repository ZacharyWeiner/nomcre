json.extract! discount_code, :id, :code, :discount_type, :expiration_date, :max_uses, :created_at, :updated_at
json.url discount_code_url(discount_code, format: :json)
