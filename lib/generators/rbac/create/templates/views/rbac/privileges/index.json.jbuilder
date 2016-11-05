json.array!(@privileges) do |privilege|
  json.extract! privilege, :id, :name, :description, :controller, :action, :is_active
  json.url privilege_url(privilege, format: :json)
end
