require 'test_helper'

class ItemVOsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_vos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_vo" do
    assert_difference('ItemVO.count') do
      post :create, :item_vo => { }
    end

    assert_redirected_to item_vo_path(assigns(:item_vo))
  end

  test "should show item_vo" do
    get :show, :id => item_vos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => item_vos(:one).to_param
    assert_response :success
  end

  test "should update item_vo" do
    put :update, :id => item_vos(:one).to_param, :item_vo => { }
    assert_redirected_to item_vo_path(assigns(:item_vo))
  end

  test "should destroy item_vo" do
    assert_difference('ItemVO.count', -1) do
      delete :destroy, :id => item_vos(:one).to_param
    end

    assert_redirected_to item_vos_path
  end
end
