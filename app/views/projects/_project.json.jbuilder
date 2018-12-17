json.extract! project, :id, :package_type_id, :company_id, :title, :brief, :deadline, :price, :deposit, :balance, :is_complete, :completed_on, :max_user_shot_list, :created_at, :updated_at
json.url project_url(project, format: :json)
