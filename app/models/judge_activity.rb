class JudgeActivity < ActiveRecord::Base
	after_initialize :init
	def init
		self.time ||= DateTime.now
	end
end
