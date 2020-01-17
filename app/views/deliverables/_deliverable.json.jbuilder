json.extract! deliverable, :id, :deliverable_type_id, :asset, :project_id, :approved, :slug, :review_link, :status, :created_at, :updated_at
json.url deliverable_url(deliverable, format: :json)
