json.extract! creative_request, :id, :shoot_id, :requested_by_id, :creative_id, :company_id, :accepted, :accepted_on, :deadline, :approved, :declined, :created_at, :updated_at
json.url creative_request_url(creative_request, format: :json)
