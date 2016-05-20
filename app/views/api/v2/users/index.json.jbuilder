json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :rut, :user_type, :suspended
  json.url user_url(user, format: :json)
end
