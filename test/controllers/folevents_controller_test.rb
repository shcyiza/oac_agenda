require 'test_helper'

class FoleventsControllerTest < ActionController::TestCase
  setup do
    @folevent = folevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:folevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create folevent" do
    assert_difference('Folevent.count') do
      post :create, folevent: { event_id: @folevent.event_id, user_id: @folevent.user_id }
    end

    assert_redirected_to folevent_path(assigns(:folevent))
  end

  test "should show folevent" do
    get :show, id: @folevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @folevent
    assert_response :success
  end

  test "should update folevent" do
    patch :update, id: @folevent, folevent: { event_id: @folevent.event_id, user_id: @folevent.user_id }
    assert_redirected_to folevent_path(assigns(:folevent))
  end

  test "should destroy folevent" do
    assert_difference('Folevent.count', -1) do
      delete :destroy, id: @folevent
    end

    assert_redirected_to folevents_path
  end
end
