json.extract! @chat, :id, :title, :user_id
json.messages do
        json.array!(@chat.messages) do |message|
            json.id message.id
            json.autor message.user.name
            json.created_at message.created_at
            json.body message.body
        end
    end