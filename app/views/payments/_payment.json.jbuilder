json.extract! payment, :id, :user_id, :project_id, :payment_type, :category, :payment_method, :external_id, :paid_on, :created_at, :updated_at
json.url payment_url(payment, format: :json)
