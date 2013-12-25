# encoding: utf-8
class GuessActivitiesController < ApplicationController
	before_filter :authenticate_admin!, :except =>[:index, :show, :guess, :judge, :new, :home]
	before_filter :authenticate_user!
	before_action :set_guess_activity, only: [:show, :edit, :update, :destroy]
	include GuessesHelper
	include GuessActivitiesHelper
	include WordsHelper
	include JudgeActivitiesHelper
	include ApplicationHelper
	# GET /guess_activities
	# GET /guess_activities.json
	def index
		@guess_activities = GuessActivity.where("user_id = ?", current_user.id)
	end

	# GET /guess_activities/1
	# GET /guess_activities/1.json
	def show
		redirect_to do_guess_path(@guess_activity.id)	
	end

	def home
		@guess_activity = get_participated(current_user.id)
	end


	def guess
		#from new button
		if params.has_key? :id
			id = params[:id]
			@guess_activity = GuessActivity.find(id)
		else
			@guess_activity = new_activity(user_id)
		end
		if @guess_activity.nil?
			return
		else

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
					add_guess(@guess_activity, params[:guess_content], params[:word_id])
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
			session[:activity]=@guess_activity	
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

	# GET /guess_activities/new
	def new
		new_word = get_word_candidate(current_user.id)
		if new_word.nil?
			no_more_guess and return
		end
		new_word_id = new_word.id
		guess_activity = add_guess_activity(current_user.id, new_word_id)
		redirect_to do_guess_path(guess_activity.id)
	end

	# GET /guess_activities/1/edit
	def edit
	end

	# POST /guess_activities
	# POST /guess_activities.json
	def create
		@guess_activity = GuessActivity.new(guess_activity_params)

		respond_to do |format|
			if @guess_activity.save
				format.html { redirect_to @guess_activity, notice: 'Guess activity was successfully created.' }
				format.json { render action: 'show', status: :created, location: @guess_activity }
			else
				format.html { render action: 'new' }
				format.json { render json: @guess_activity.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /guess_activities/1
	# PATCH/PUT /guess_activities/1.json
	def update
		respond_to do |format|
			if @guess_activity.update(guess_activity_params)
				format.html { redirect_to @guess_activity, notice: 'Guess activity was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @guess_activity.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /guess_activities/1
	# DELETE /guess_activities/1.json
	def destroy
		@guess_activity.destroy
		respond_to do |format|
			format.html { redirect_to guess_activities_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_guess_activity
		@guess_activity = GuessActivity.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def guess_activity_params
		params.require(:guess_activity).permit(:time, :user_id, :word_id, :status)
	end
end
