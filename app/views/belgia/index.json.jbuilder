json.array!(@belgia) do |belgium|
  json.extract! belgium, :id, :ville, :codepostal
  json.url belgium_url(belgium, format: :json)
end
