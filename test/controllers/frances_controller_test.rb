require 'test_helper'

class FrancesControllerTest < ActionController::TestCase
  setup do
    @france = frances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create france" do
    assert_difference('France.count') do
      post :create, france: { codepostal: @france.codepostal, ville: @france.ville }
    end

    assert_redirected_to france_path(assigns(:france))
  end

  test "should show france" do
    get :show, id: @france
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @france
    assert_response :success
  end

  test "should update france" do
    patch :update, id: @france, france: { codepostal: @france.codepostal, ville: @france.ville }
    assert_redirected_to france_path(assigns(:france))
  end

  test "should destroy france" do
    assert_difference('France.count', -1) do
      delete :destroy, id: @france
    end

    assert_redirected_to frances_path
  end
end
