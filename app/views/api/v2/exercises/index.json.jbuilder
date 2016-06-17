json.array!(@exercises) do |exercise|
	json.extract! exercise, :id, :user_id,:practice_id, :plunk, :embed, :created_at, :updated_at
end
