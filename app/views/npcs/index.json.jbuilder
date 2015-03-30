json.array!(@npcs) do |npc|
  json.extract! npc, :id, :name, :level, :pv, :atk, :def
  json.url npc_url(npc, format: :json)
end
