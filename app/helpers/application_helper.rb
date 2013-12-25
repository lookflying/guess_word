module ApplicationHelper
	def get_judge_candidates(user_id)
		judged = JudgeActivity.where(user_id: user_id).pluck(:word_id)
		unfinished = GuessActivity.where(user_id: user_id).where.not(status: "finished").pluck(:word_id)
		candidates = Guess.where(judge: "new").where.not(word_id: unfinished).where(word_id: judged)
		candidates += Guess.where(judge: "new").where.not(word_id: unfinished).where.not(word_id: judged)
	end

	def get_word_candidate(user_id)
		participated = GuessActivity.where(user_id: user_id).pluck(:word_id)
		judged = JudgeActivity.where(user_id: user_id).pluck(:word_id)
		candidates = Word.where.not(id: participated + judged).order("count ASC")
		candidates += Word.where(id: judged - participated).order("count ASC")
		candidate = candidates.first
	end

	def add_judge_activity(user_id, word_id)
			if JudgeActivity.where(user_id: user_id, word_id: word_id).empty?
				JudgeActivity.create(user_id: user_id, word_id: word_id)
			end
	end

	def add_guess(guess_activity, guess_content, word_id)
		if guess_activity.status != "finished"
			guess = Guess.new
			guess.do_guess(guess_activity.user_id, word_id, guess_content)
			if guess_content == Word.find(word_id).word
				guess.do_judge(0, :guess_right)
				guess_activity.update(status: :finished)
			end
		end
	end


	def wrong_url
		flash[:warning] = "wrong url!"
		redirect_to root_path 
	end

	def add_guess_activity(user_id, word_id)
		word = Word.find(word_id)
		if word.nil?
			return nil
		else
			guess_activity = GuessActivity.create(user_id: user_id, word_id: word_id)
			word.update(count: word.count + 1)
			guess_activity
		end
	end

end
