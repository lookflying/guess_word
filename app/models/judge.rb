class Judge < ActiveRecord::Base
	def judge(user_id, guess_id, judge)
		self.time = DateTime.now
		self.user_id = user_id
		self.guess_id = guess_id
		self.judge = judge
		self.save
	end
end
