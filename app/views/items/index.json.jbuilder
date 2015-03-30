json.array!(@items) do |item|
  json.extract! item, :id, :name, :pv, :atk, :def, :slot
  json.url item_url(item, format: :json)
end
