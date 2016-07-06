json.array!(@orgns) do |orgn|
  json.extract! orgn, :id, :user_id, :oname, :odesc, :oemail, :onum
  json.url orgn_url(orgn, format: :json)
end
