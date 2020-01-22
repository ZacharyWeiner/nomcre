json.extract! email_detail, :id, :email_id, :detail_type, :content, :order, :created_at, :updated_at
json.url email_detail_url(email_detail, format: :json)
