json.array!(@quests) do |quest|
  json.extract! quest, :id, :npc_id, :name
  json.url quest_url(quest, format: :json)
end
