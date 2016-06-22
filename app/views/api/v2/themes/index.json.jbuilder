json.array!(@themes) do |item|
	json.extract! item, :id, :title, :open, :created_at
	json.user @authors[item.id].name
end