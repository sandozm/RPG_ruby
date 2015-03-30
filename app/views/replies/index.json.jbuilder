json.array!(@replies) do |reply|
  json.extract! reply, :id, :question_id, :reply
  json.url reply_url(reply, format: :json)
end
