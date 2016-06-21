json.array!(@questions) do |question|
	json.extract! question, :id, :topic_id, :sentence,:answer,:question_type, :created_at, :updated_at, :image
end
