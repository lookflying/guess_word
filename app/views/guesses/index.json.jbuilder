json.array!(@guesses) do |guess|
  json.extract! guess, :id, :time, :user_id, :word_id, :content, :judge_id, :judge
  json.url guess_url(guess, format: :json)
end
