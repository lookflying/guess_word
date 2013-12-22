json.array!(@guess_activities) do |guess_activity|
  json.extract! guess_activity, :id, :user_id, :word_id
  json.url guess_activity_url(guess_activity, format: :json)
end
