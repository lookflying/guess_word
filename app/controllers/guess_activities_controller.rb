# encoding: utf-8
class GuessActivitiesController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_guess_activity, only: [:show, :edit, :update, :destroy]
	include GuessesHelper
	include GuessActivitiesHelper
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

	def guess
		id = params[:id]
		#use word_id and user_id to determine the activity id for the sake of safety
		word_id	= GuessActivity.find(id).word_id
		#check the user
		user_id = GuessActivity.find(id).user_id
		if user_id != current_user.id
			flash[:warning] = "wrong url!"
			redirect_to root_path and return
		end
		user_id = current_user.id
		@guess_activity = GuessActivity.where(word_id: word_id, user_id: user_id).first
		@word = Word.find(@guess_activity.word_id)
		@old_guesses = get_guesses(@word.id, @guess_activity.user_id, nil)
		@guess_to_judge = get_guesses_exclude(get_guessed(@guess_activity.user_id)).first
		if @guess_to_judge.nil?
			@word_of_guess_to_judge = nil
		else
			@word_of_guess_to_judge = Word.find(@guess_to_judge.word_id)
		end
	end

  # GET /guess_activities/new
  def new
		guessed_word = get_guessed(current_user.id)
		new_words = Word.where.not(id: guessed_word)
		if new_words.empty?
			flash[:warning] = "no more words to guess!"
			redirect_to root_path and return
		end
		new_word_id = new_words.first.id
		@guess_activity = GuessActivity.create(user_id: current_user.id, word_id: new_word_id)
		redirect_to do_guess_path(@guess_activity.id)
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
