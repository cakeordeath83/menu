json.array!(@retailers) do |retailer|
  json.extract! retailer, :id, :name, :address, :description
  json.url retailer_url(retailer, format: :json)
end
