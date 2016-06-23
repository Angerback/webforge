json.extract! @tema, :id, :title, :content, :open, :created_at
json.user @autor.name
json.user_email @autor.email
json.comments do
	json.array!(@comentarios) do |item|
		json.extract! item, :id, :theme_id, :contenido, :user_id, :created_at
		json.user @autor_c[item.id].name
		json.user_email @autor_c[item.id].email
	end
end