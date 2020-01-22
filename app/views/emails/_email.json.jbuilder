json.extract! email, :id, :email_template_id, :created_at, :updated_at
json.url email_url(email, format: :json)
