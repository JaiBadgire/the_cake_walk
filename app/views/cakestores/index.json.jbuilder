json.array!(@cakestores) do |cakestore|
  json.extract! cakestore, :id, :cake_name, :description, :cake_weight, :price, :quantity, :occasion
  json.url cakestore_url(cakestore, format: :json)
end
