json.array!(@themes) do |theme|
	json.extract! theme, :id, :title, :content, :open, :created_at
end