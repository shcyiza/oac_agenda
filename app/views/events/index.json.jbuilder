json.array!(@events) do |event|
  json.extract! event, :id, :orgn_id, :enom, :edesc, :edate, :pafpre, :pafplace, :pays, :ville, :codepostal, :rue, :nrrue
  json.url event_url(event, format: :json)
end
