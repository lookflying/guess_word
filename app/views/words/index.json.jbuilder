json.array!(@words) do |word|
  json.extract! word, :id, :word, :property, :count
  json.url word_url(word, format: :json)
end
