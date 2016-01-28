json.array!(@links) do |link|
  json.extract! link, :id, :identifier, :url_id
  json.url link_url(link, format: :json)
end
