require 'test_helper'

class BelgiaControllerTest < ActionController::TestCase
  setup do
    @belgium = belgia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:belgia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create belgium" do
    assert_difference('Belgium.count') do
      post :create, belgium: { codepostal: @belgium.codepostal, ville: @belgium.ville }
    end

    assert_redirected_to belgium_path(assigns(:belgium))
  end

  test "should show belgium" do
    get :show, id: @belgium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @belgium
    assert_response :success
  end

  test "should update belgium" do
    patch :update, id: @belgium, belgium: { codepostal: @belgium.codepostal, ville: @belgium.ville }
    assert_redirected_to belgium_path(assigns(:belgium))
  end

  test "should destroy belgium" do
    assert_difference('Belgium.count', -1) do
      delete :destroy, id: @belgium
    end

    assert_redirected_to belgia_path
  end
end
