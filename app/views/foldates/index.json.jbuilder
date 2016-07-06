json.array!(@foldates) do |foldate|
  json.extract! foldate, :id, :user_id, :datefolwd
  json.url foldate_url(foldate, format: :json)
end
