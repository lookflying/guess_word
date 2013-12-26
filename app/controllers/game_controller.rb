class GameController < ApplicationController
	include GameHelper
	include GuessesHelper
	include ApplicationHelper
	before_filter :authenticate_user!, :except=> :test
	def guess
		#from new button
		if params.has_key? :id
			id = params[:id]
			@guess_activity = GuessActivity.find(id)
		else
			@guess_activity = new_activity(current_user.id)
		end
		if @guess_activity.nil?
			return
		else
			params[:id] = @guess_activity.id
			#from judge page
			if params.has_key?(:guess_to_judge_id)
				if params[:judge].nil?
					flash[:warning] = "You have to judge others' guess to continue!"
				else
					new_judge = Judge.new
					new_judge.do_judge(current_user.id, params[:guess_to_judge_id], params[:judge])
					guess_judged = Guess.find(params[:guess_to_judge_id])
					guess_judged.do_judge(new_judge.id, new_judge.judge)
					add_judge_activity(current_user.id, guess_judged.word_id)
					if params[:judge] == "guess_right"
						guess_activity_judged = GuessActivity.where(user_id: guess_judged.user_id, word_id: guess_judged.word_id).first
						guess_activity_judged.update(status: :finished)
					end
				end
			end
			#from guess page
			if !@guess_activity.finished? and params.has_key? :guess_content 
				if params[:guess_content].empty?
					empty_guess
				else	
					add_guess(@guess_activity, params[:guess_content])
					params[:guess_content] = ""
				end
			end

			#for display
			#use word_id and user_id to determine the activity id for the sake of safety
			if @guess_activity.nil?
				wrong_url and return 
			else
				word_id	= @guess_activity.word_id
				#check the user
				user_id = @guess_activity.user_id
				if user_id != current_user.id
					wrong_url and return
				end
			end
			@word = Word.find(@guess_activity.word_id)
			@old_guesses = get_guesses(@word.id, @guess_activity.user_id, nil)
			@guess_to_judge = get_judge_candidates(@guess_activity.user_id).first
			@new_guess = Guess.new
			if @guess_to_judge.nil?
				@word_of_guess_to_judge = nil
			else
				@word_of_guess_to_judge = Word.find(@guess_to_judge.word_id)
			end
		end
	end

	def home
		@guess_activity = get_participated(current_user.id)
	end

	def test
		#render json: DateTime.now
		render json: nil
	end

	def guessed
		if params.has_key? :id
			id = params[:id]
			activity = GuessActivity.find(id)
			if activity.nil?
				render json: nil
			else
				if activity.user_id != current_user.id
					render json: nil
				else
					old_guesses = Guess.where(user_id: activity.user_id, word_id: activity.word_id)
					guesses_json = Jbuilder.encode do |json|
						json.array! old_guesses do |g|
							json.id g.id
							json.content g.content
							json.judge g.judge
						end
					end
					render json: guesses_json
				end
			end
		else
			render json: nil
		end
	end

	def judge
		#judge
		if params.has_key?(:guess_id) and params.has_key?(:judge)
			new_judge = Judge.new
			new_judge.do_judge(current_user.id, params[:guess_id], params[:judge])
			guess_judged = Guess.find(params[:guess_id])
			guess_judged.do_judge(new_judge.id, new_judge.judge)
			add_judge_activity(current_user.id, guess_judged.word_id)
			if params[:judge] == "guess_right"
				guess_activity_judged = GuessActivity.where(user_id: guess_judged.user_id, word_id: guess_judged.word_id).first
				guess_activity_judged.update(status: :finished)
			end
		end

		#display
		@judge_candidate = get_judge_candidates(current_user.id).first
		if !@judge_candidate.nil?
			@word = Word.find(@judge_candidate.word_id)
			@guess_id = @judge_candidate.id
			@guess_content = @judge_candidate.content
		else
			flash[:warning] = "No available guesses to judge! Please come back later."
		end	
	end

end
