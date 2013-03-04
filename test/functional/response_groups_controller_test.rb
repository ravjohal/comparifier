require 'test_helper'

class ResponseGroupsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:response_groups)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_response_group
    assert_difference('ResponseGroup.count') do
      post :create, :response_group => { }
    end

    assert_redirected_to response_group_path(assigns(:response_group))
  end

  def test_should_show_response_group
    get :show, :id => response_groups(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => response_groups(:one).id
    assert_response :success
  end

  def test_should_update_response_group
    put :update, :id => response_groups(:one).id, :response_group => { }
    assert_redirected_to response_group_path(assigns(:response_group))
  end

  def test_should_destroy_response_group
    assert_difference('ResponseGroup.count', -1) do
      delete :destroy, :id => response_groups(:one).id
    end

    assert_redirected_to response_groups_path
  end
end
