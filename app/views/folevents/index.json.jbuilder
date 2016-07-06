json.array!(@folevents) do |folevent|
  json.extract! folevent, :id, :user_id, :event_id
  json.url folevent_url(folevent, format: :json)
end
