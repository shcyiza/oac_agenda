require 'test_helper'

class OrgnsControllerTest < ActionController::TestCase
  setup do
    @orgn = orgns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orgn" do
    assert_difference('Orgn.count') do
      post :create, orgn: { odesc: @orgn.odesc, oemail: @orgn.oemail, oname: @orgn.oname, onum: @orgn.onum, user_id: @orgn.user_id }
    end

    assert_redirected_to orgn_path(assigns(:orgn))
  end

  test "should show orgn" do
    get :show, id: @orgn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orgn
    assert_response :success
  end

  test "should update orgn" do
    patch :update, id: @orgn, orgn: { odesc: @orgn.odesc, oemail: @orgn.oemail, oname: @orgn.oname, onum: @orgn.onum, user_id: @orgn.user_id }
    assert_redirected_to orgn_path(assigns(:orgn))
  end

  test "should destroy orgn" do
    assert_difference('Orgn.count', -1) do
      delete :destroy, id: @orgn
    end

    assert_redirected_to orgns_path
  end
end
