class GuessActivitiesController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_guess_activity, only: [:show, :edit, :update, :destroy]

  # GET /guess_activities
  # GET /guess_activities.json
  def index
    @guess_activities = GuessActivity.where("user_id = ?", current_user.id)
  end

  # GET /guess_activities/1
  # GET /guess_activities/1.json
  def show

  end

  # GET /guess_activities/new
  def new
    @guess_activity = GuessActivity.new
		@guess_activity.time = DateTime.now
		@guess_activity.user_id = current_user.id
		@guess_activity.word_id = Word.first.id
		@guess_activity.status = "new"
		@guess_activity.save
		redirect_to guess_activities_path
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
