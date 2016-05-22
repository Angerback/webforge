json.extract! @course, :id, :name, :semester, :created_at, :updated_at, :year
json.users @course.users.size
