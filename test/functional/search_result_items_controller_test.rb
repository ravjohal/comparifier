require 'test_helper'

class SearchResultItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_result_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_result_item" do
    assert_difference('SearchResultItem.count') do
      post :create, :search_result_item => { }
    end

    assert_redirected_to search_result_item_path(assigns(:search_result_item))
  end

  test "should show search_result_item" do
    get :show, :id => search_result_items(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => search_result_items(:one).to_param
    assert_response :success
  end

  test "should update search_result_item" do
    put :update, :id => search_result_items(:one).to_param, :search_result_item => { }
    assert_redirected_to search_result_item_path(assigns(:search_result_item))
  end

  test "should destroy search_result_item" do
    assert_difference('SearchResultItem.count', -1) do
      delete :destroy, :id => search_result_items(:one).to_param
    end

    assert_redirected_to search_result_items_path
  end
end
