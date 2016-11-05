json.array!(@groups) do |group|
  json.extract! group, :id, :name, :description, :is_active
  json.url group_url(group, format: :json)
end
