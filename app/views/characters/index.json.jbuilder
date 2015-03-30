json.array!(@characters) do |character|
  json.extract! character, :id, :users_id, :name, :pv, :atk, :def
  json.url character_url(character, format: :json)
end
