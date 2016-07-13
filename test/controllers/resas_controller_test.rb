require 'test_helper'

class ResasControllerTest < ActionController::TestCase
  setup do
    @resa = resas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resa" do
    assert_difference('Resa.count') do
      post :create, resa: { event_id: @resa.event_id, resa_claimed: @resa.resa_claimed, resanr: @resa.resanr, user_id: @resa.user_id }
    end

    assert_redirected_to resa_path(assigns(:resa))
  end

  test "should show resa" do
    get :show, id: @resa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resa
    assert_response :success
  end

  test "should update resa" do
    patch :update, id: @resa, resa: { event_id: @resa.event_id, resa_claimed: @resa.resa_claimed, resanr: @resa.resanr, user_id: @resa.user_id }
    assert_redirected_to resa_path(assigns(:resa))
  end

  test "should destroy resa" do
    assert_difference('Resa.count', -1) do
      delete :destroy, id: @resa
    end

    assert_redirected_to resas_path
  end
end
