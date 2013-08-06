json.array!(@pins) do |pin|
  json.extract! pin, :name, :lat, :lng, :acc
  json.url pin_url(pin, format: :json)
end
