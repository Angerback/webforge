json.array!(@courses) do |course|
  json.extract! course, :id, :name, :semester, :created_at, :updated_at, :year
  json.url course_url(course, format: :json)
end
