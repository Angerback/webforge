json.array!(@comments) do |item|
	json.extract! item, :id, :contenido, :created_at
end