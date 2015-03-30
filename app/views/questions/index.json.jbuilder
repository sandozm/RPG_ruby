json.array!(@questions) do |question|
  json.extract! question, :id, :quests_id, :question
  json.url question_url(question, format: :json)
end
