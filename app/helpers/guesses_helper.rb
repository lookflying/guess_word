module GuessesHelper
	def get_guesses(word_id, user_id, judge)
		if judge.nil?
			if user_id.nil?
				Guess.where("word_id = ?", word_id)
			else
				Guess.where("word_id = ? AND user_id = ?", word_id, user_id)
			end
		else
			if user_id.nil?
				Guess.where("word_id = ? AND judge = ?", word_id, judge)
			else
				Guess.where("word_id = ? AND user_id = ? AND judge = ?", word_id, user_id, judge)
			end
		end
	end	

	def get_guesses_exclude(guessed)
		Guess.where.not(word_id: guessed)
	end

	def get_new_guesses_exclude(range)
		Guess.where.not(word_id: range).where(judge: "new")
	end
	
	def get_candidate_guesses(judged_words, guessed_words, unfinished) 
		candidates = Guess.where.not(word_id: unfinished).where(word_id: judged_words)
		if candidates.empty?
			candidates = Guess.where(word_id: guessed_words)
		end
	end	

end
