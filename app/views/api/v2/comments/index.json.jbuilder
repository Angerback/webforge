json.array!(@comments) do |item|
	json.extract! item, :id, :id_theme, :contenido, :created_at
end