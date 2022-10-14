json.extract! todo_entry, :id, :created_at, :updated_at
json.url todo_entry_url(todo_entry, format: :json)
