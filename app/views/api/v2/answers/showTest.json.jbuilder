json.array!(@answers) do |answer|
	json.extract! answer, :id, :test_id, :question_id, :alternative, :created_at, :updated_at
end
