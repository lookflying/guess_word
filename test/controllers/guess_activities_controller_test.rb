require 'test_helper'

class GuessActivitiesControllerTest < ActionController::TestCase
  setup do
    @guess_activity = guess_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guess_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guess_activity" do
    assert_difference('GuessActivity.count') do
      post :create, guess_activity: { status: @guess_activity.status, time: @guess_activity.time, user_id: @guess_activity.user_id, word_id: @guess_activity.word_id }
    end

    assert_redirected_to guess_activity_path(assigns(:guess_activity))
  end

  test "should show guess_activity" do
    get :show, id: @guess_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guess_activity
    assert_response :success
  end

  test "should update guess_activity" do
    patch :update, id: @guess_activity, guess_activity: { status: @guess_activity.status, time: @guess_activity.time, user_id: @guess_activity.user_id, word_id: @guess_activity.word_id }
    assert_redirected_to guess_activity_path(assigns(:guess_activity))
  end

  test "should destroy guess_activity" do
    assert_difference('GuessActivity.count', -1) do
      delete :destroy, id: @guess_activity
    end

    assert_redirected_to guess_activities_path
  end
end
