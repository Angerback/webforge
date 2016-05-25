json.array!(@chats) do |chat|
  json.extract! chat, :id, :title
  json.last_message @messages[chat.id].body
  json.author_last_message @messages[chat.id].user.name
  json.autor_chat @owners[chat.id].name
end