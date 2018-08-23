json.extract! lead, :id, :name, :email, :company_name, :office_phone, :cell_phone, :last_contacted, :next_contact, :created_at, :updated_at
json.url lead_url(lead, format: :json)
