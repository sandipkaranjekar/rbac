json.array!(@roles) do |role|
  json.extract! role, :id, :role_name, :role_description, :is_active
  json.url role_url(role, format: :json)
end
