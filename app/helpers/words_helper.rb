module WordsHelper
	def pick_new_word(guessed)
		new_word = Word.where.not(id: guessed).order('count ASC').first
		new_word.update(count: new_word.count + 1)
		new_word
	end
end
