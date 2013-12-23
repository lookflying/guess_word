module GuessActivitiesHelper
	def get_finished(user_id)
		GuessActivity.where(user_id: user_id, status: "finished").pluck(:word_id)
	end

	def get_participated(user_id)
		GuessActivity.where(user_id: user_id).pluck(:word_id)
	end

	def get_unfinished(user_id)
		GuessActivity.where(user_id: user_id, status: "new").pluck(:word_id)
	end
end
