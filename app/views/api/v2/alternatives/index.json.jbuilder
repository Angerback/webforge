json.array!(@alternatives) do |alternative|
	json.extract! alternative, :id, :question_id, :sentence, :created_at, :updated_at
end
