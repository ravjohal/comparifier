require 'test_helper'

class SortCriteriasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:sort_criterias)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_sort_criteria
    assert_difference('SortCriteria.count') do
      post :create, :sort_criteria => { }
    end

    assert_redirected_to sort_criteria_path(assigns(:sort_criteria))
  end

  def test_should_show_sort_criteria
    get :show, :id => sort_criterias(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => sort_criterias(:one).id
    assert_response :success
  end

  def test_should_update_sort_criteria
    put :update, :id => sort_criterias(:one).id, :sort_criteria => { }
    assert_redirected_to sort_criteria_path(assigns(:sort_criteria))
  end

  def test_should_destroy_sort_criteria
    assert_difference('SortCriteria.count', -1) do
      delete :destroy, :id => sort_criterias(:one).id
    end

    assert_redirected_to sort_criterias_path
  end
end
