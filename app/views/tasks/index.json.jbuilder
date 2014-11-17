json.array!(@tasks) do |task|
  json.extract! task, :id, :list_id, :goals
  json.url task_url(task, format: :json)
end
