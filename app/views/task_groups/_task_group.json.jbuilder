json.extract! task_group, :id, :title, :shoot_id, :complete, :approver_id, :created_at, :updated_at
json.url task_group_url(task_group, format: :json)
