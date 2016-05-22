json.array!(@test) do |t|
  json.extract! t, :id, :user_id, :evaluation_id, :grade, :created_at, :updated_at
  json.url user_url(t, format: :json)
end

