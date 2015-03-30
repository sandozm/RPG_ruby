json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :characters_id, :items_id
  json.url inventory_url(inventory, format: :json)
end
