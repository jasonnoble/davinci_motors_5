json.array!(@cars) do |car|
  json.extract! car, :make, :model, :year, :price
  json.url car_url(car, format: :json)
end
