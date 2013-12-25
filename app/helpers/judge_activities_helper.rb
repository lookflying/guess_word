module JudgeActivitiesHelper
	def get_judged(user_id)
		JudgeActivity.where(user_id: user_id).pluck(:word_id)
	end

end
