json.array!(@users) do |user|
	json.extract! user, :id, :email, :name, :rut, :user_type, :suspended, :sign_in_count
	json.set! :name_test, @evaluation.name
	json.set! :test, Test.where( :user_id => user.id, :grade =>  0.9..7.1 ).last
	json.url user_url(user, format: :json)
end
