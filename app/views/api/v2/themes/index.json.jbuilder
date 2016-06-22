json.array!(@themes) do |item|
	json.extract! item, :id, :title, :content, :open, :created_at
	json.user @authors[item.id].name
end