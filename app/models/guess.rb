class Guess < ActiveRecord::Base
	after_initialize :init
	def init
		self.judge = :new
	end
	def do_judge(judge_id, judge)
		self.update(judge_id: judge_id, judge: judge)
	end
	def guess(user_id, word_id, content)
		self.time = DateTime.now
		self.user_id = user_id
		self.word_id = word_id
		self.content = content
		self.save
	end
end
