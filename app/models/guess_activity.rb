class GuessActivity < ActiveRecord::Base
	after_initialize :init
	def init
		self.time ||= DateTime.now
		self.status ||= :new
	end

	def finished?
		self.status == "finished"
	end
end
