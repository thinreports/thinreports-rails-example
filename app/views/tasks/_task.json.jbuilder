json.extract! task, :id, :name, :due_date, :done, :created_at, :updated_at
json.url task_url(task, format: :json)
