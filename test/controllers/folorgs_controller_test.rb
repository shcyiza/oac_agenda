require 'test_helper'

class FolorgsControllerTest < ActionController::TestCase
  setup do
    @folorg = folorgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:folorgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create folorg" do
    assert_difference('Folorg.count') do
      post :create, folorg: { orgn_id: @folorg.orgn_id, user_id: @folorg.user_id }
    end

    assert_redirected_to folorg_path(assigns(:folorg))
  end

  test "should show folorg" do
    get :show, id: @folorg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @folorg
    assert_response :success
  end

  test "should update folorg" do
    patch :update, id: @folorg, folorg: { orgn_id: @folorg.orgn_id, user_id: @folorg.user_id }
    assert_redirected_to folorg_path(assigns(:folorg))
  end

  test "should destroy folorg" do
    assert_difference('Folorg.count', -1) do
      delete :destroy, id: @folorg
    end

    assert_redirected_to folorgs_path
  end
end
