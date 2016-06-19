json.array!(@topics) do |topic|
	json.extract! topic, :id, :name, :path, :created_at, :updated_at
end
