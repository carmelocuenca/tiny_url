json.array!(@urls) do |url|
  json.extract! url, :id, :original
  json.url url_url(url, format: :json)
end
