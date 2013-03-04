require 'test_helper'

class SearchIndicesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:search_indices)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_search_index
    assert_difference('SearchIndex.count') do
      post :create, :search_index => { }
    end

    assert_redirected_to search_index_path(assigns(:search_index))
  end

  def test_should_show_search_index
    get :show, :id => search_indices(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => search_indices(:one).id
    assert_response :success
  end

  def test_should_update_search_index
    put :update, :id => search_indices(:one).id, :search_index => { }
    assert_redirected_to search_index_path(assigns(:search_index))
  end

  def test_should_destroy_search_index
    assert_difference('SearchIndex.count', -1) do
      delete :destroy, :id => search_indices(:one).id
    end

    assert_redirected_to search_indices_path
  end
end
