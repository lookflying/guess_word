json.array!(@judge_activities) do |judge_activity|
  json.extract! judge_activity, :id, :user_id, :word_id
  json.url judge_activity_url(judge_activity, format: :json)
end
