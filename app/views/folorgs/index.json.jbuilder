json.array!(@folorgs) do |folorg|
  json.extract! folorg, :id, :user_id, :orgn_id
  json.url folorg_url(folorg, format: :json)
end
