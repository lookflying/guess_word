json.array!(@judges) do |judge|
  json.extract! judge, :id, :time, :user_id, :guess_id, :judge
  json.url judge_url(judge, format: :json)
end
