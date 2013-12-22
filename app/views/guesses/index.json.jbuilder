json.array!(@guesses) do |guess|
  json.extract! guess, :id, :time, :user_id, :word_id, :content
  json.url guess_url(guess, format: :json)
end
