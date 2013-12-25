class AdminController < ApplicationController
	before_filter :authenticate_admin!
	def home

	end

	def users
		@all_users = User.all
	end
end
