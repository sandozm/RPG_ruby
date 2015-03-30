json.array!(@rewards) do |reward|
  json.extract! reward, :id, :quests_id, :items_id
  json.url reward_url(reward, format: :json)
end
