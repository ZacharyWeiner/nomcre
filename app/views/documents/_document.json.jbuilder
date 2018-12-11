json.extract! document, :id, :proposal_id, :user_id, :company_id, :assistant_id, :title, :file, :media, :document_type, :is_template, :created_at, :updated_at
json.url document_url(document, format: :json)
