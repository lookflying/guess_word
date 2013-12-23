class Word < ActiveRecord::Base
	after_initialize :init
	def init
		self.count ||= 0
	end
	def length
		self.word.length
	end
end
