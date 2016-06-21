json.array!(@compositions) do |composition|
	json.extract! composition, :id, :evaluation_id, :question_id,:number,:created_at, :updated_at
end
