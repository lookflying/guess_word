module GuessActivitiesHelper
	def get_guessed(user_id)
		GuessActivity.where(user_id: user_id).pluck(:word_id)
	end
end
