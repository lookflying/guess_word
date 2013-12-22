require 'test_helper'

class JudgeActivitiesControllerTest < ActionController::TestCase
  setup do
    @judge_activity = judge_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:judge_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create judge_activity" do
    assert_difference('JudgeActivity.count') do
      post :create, judge_activity: { user_id: @judge_activity.user_id, word_id: @judge_activity.word_id }
    end

    assert_redirected_to judge_activity_path(assigns(:judge_activity))
  end

  test "should show judge_activity" do
    get :show, id: @judge_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @judge_activity
    assert_response :success
  end

  test "should update judge_activity" do
    patch :update, id: @judge_activity, judge_activity: { user_id: @judge_activity.user_id, word_id: @judge_activity.word_id }
    assert_redirected_to judge_activity_path(assigns(:judge_activity))
  end

  test "should destroy judge_activity" do
    assert_difference('JudgeActivity.count', -1) do
      delete :destroy, id: @judge_activity
    end

    assert_redirected_to judge_activities_path
  end
end
