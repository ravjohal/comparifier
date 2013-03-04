require 'test_helper'

class ComparifierRequestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comparifier_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comparifier_request" do
    assert_difference('ComparifierRequest.count') do
      post :create, :comparifier_request => { }
    end

    assert_redirected_to comparifier_request_path(assigns(:comparifier_request))
  end

  test "should show comparifier_request" do
    get :show, :id => comparifier_requests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => comparifier_requests(:one).to_param
    assert_response :success
  end

  test "should update comparifier_request" do
    put :update, :id => comparifier_requests(:one).to_param, :comparifier_request => { }
    assert_redirected_to comparifier_request_path(assigns(:comparifier_request))
  end

  test "should destroy comparifier_request" do
    assert_difference('ComparifierRequest.count', -1) do
      delete :destroy, :id => comparifier_requests(:one).to_param
    end

    assert_redirected_to comparifier_requests_path
  end
end
