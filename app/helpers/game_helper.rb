module GameHelper
	def get_finished(user_id)
		GuessActivity.where(user_id: user_id, status: "finished")
	end

	def get_participated(user_id)
		GuessActivity.where(user_id: user_id)
	end

	def get_unfinished(user_id)
		GuessActivity.where(user_id: user_id, status: "new")
	end

	def empty_guess
		flash[:warning] = "You guess is empty!"
	end

	def no_more_guess
			flash[:warning] = "no more words to guess!"
			redirect_to home_path
	end

	def too_many_unfinished
			flash[:warning] = "You have too many unfinished guesses!"
			redirect_to home_path
	end

	def display_time(activity)
		activity.time.strftime("%Y-%m-%d %H:%M:%S" )
	end

	def display_word(activity)
		if activity.status != "finished"
			"unkown"
		else
			Word.find(activity.word_id).word
		end
	end

	def display_action(activity)
		if activity.status != "finished"
			"Guess"
		else
			"View"
		end
	end

	def new_activity(user_id)
		#FIXME put limitation in configuration file!!!
		if get_unfinished(user_id).count >= 4
			too_many_unfinished and return nil
		else
			new_word = get_word_candidate(user_id)
			if new_word.nil?
				no_more_guess and return nil
			end
			guess_activity = add_guess_activity(user_id, new_word.id)
		end
	end

	@@judge_map = {"new" => -1, "false" => 0, "true" => 1, "not_sure" => 2, "guess_right" => 3}
	def encode_judge(judge)
		if @@judge_map.has_key? judge
			@@judge_map[judge]
		else
			-2
		end
	end
end
