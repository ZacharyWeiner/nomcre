json.extract! invoice, :id, :project_id, :company_id, :payment_id, :amount, :due_date, :invoice_type, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
