json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :name, :description, :questions, :created_at, :updated_at
  json.url course_url(evaluation, format: :json)
end
