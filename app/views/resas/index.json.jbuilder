json.array!(@resas) do |resa|
  json.extract! resa, :id, :user_id, :event_id, :resanr, :resa_claimed
  json.url resa_url(resa, format: :json)
end
