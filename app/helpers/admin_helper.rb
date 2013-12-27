module AdminHelper
	def get_guess_activities_count(user_id)
		GuessActivity.where(user_id: user_id).count
	end

	def get_judge_activities_count(user_id)
		JudgeActivity.where(user_id:user_id).count
	end

	def get_guesses_count(user_id)
		Guess.where(user_id: user_id).count
	end

	def	get_judges_count(user_id)
		Judge.where(user_id: user_id).count
	end

	def get_finished_guess_activities_count(user_id)
		GuessActivity.where(user_id: user_id, status: "finished").count
	end
end
