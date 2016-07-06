json.array!(@frances) do |france|
  json.extract! france, :id, :ville, :codepostal
  json.url france_url(france, format: :json)
end
