require 'test_helper'

class FoldatesControllerTest < ActionController::TestCase
  setup do
    @foldate = foldates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foldates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foldate" do
    assert_difference('Foldate.count') do
      post :create, foldate: { datefolwd: @foldate.datefolwd, user_id: @foldate.user_id }
    end

    assert_redirected_to foldate_path(assigns(:foldate))
  end

  test "should show foldate" do
    get :show, id: @foldate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foldate
    assert_response :success
  end

  test "should update foldate" do
    patch :update, id: @foldate, foldate: { datefolwd: @foldate.datefolwd, user_id: @foldate.user_id }
    assert_redirected_to foldate_path(assigns(:foldate))
  end

  test "should destroy foldate" do
    assert_difference('Foldate.count', -1) do
      delete :destroy, id: @foldate
    end

    assert_redirected_to foldates_path
  end
end
