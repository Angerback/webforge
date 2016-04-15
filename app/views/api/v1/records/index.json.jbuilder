json.array!(@records) do |record|
  json.extract! record, :id, :operation, :owner_id, :receiver_id, :amount, :created_at
  json.url record_url(record, format: :json)
end
