class JudgeActivitiesController < ApplicationController
	before_filter :authenticate_admin!
  before_action :set_judge_activity, only: [:show, :edit, :update, :destroy]

  # GET /judge_activities
  # GET /judge_activities.json
  def index
    @judge_activities = JudgeActivity.all
  end

  # GET /judge_activities/1
  # GET /judge_activities/1.json
  def show
  end

  # GET /judge_activities/new
  def new
    @judge_activity = JudgeActivity.new
  end

  # GET /judge_activities/1/edit
  def edit
  end

  # POST /judge_activities
  # POST /judge_activities.json
  def create
    @judge_activity = JudgeActivity.new(judge_activity_params)

    respond_to do |format|
      if @judge_activity.save
        format.html { redirect_to @judge_activity, notice: 'Judge activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @judge_activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @judge_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /judge_activities/1
  # PATCH/PUT /judge_activities/1.json
  def update
    respond_to do |format|
      if @judge_activity.update(judge_activity_params)
        format.html { redirect_to @judge_activity, notice: 'Judge activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @judge_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /judge_activities/1
  # DELETE /judge_activities/1.json
  def destroy
    @judge_activity.destroy
    respond_to do |format|
      format.html { redirect_to judge_activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_judge_activity
      @judge_activity = JudgeActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def judge_activity_params
      params.require(:judge_activity).permit(:time, :user_id, :word_id)
    end
end
