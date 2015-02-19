require 'test_helper'

class KnowsControllerTest < ActionController::TestCase
  setup do
    @know = knows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create know" do
    assert_difference('Know.count') do
      post :create, know: { descripcion: @know.descripcion, name: @know.name }
    end

    assert_redirected_to know_path(assigns(:know))
  end

  test "should show know" do
    get :show, id: @know
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @know
    assert_response :success
  end

  test "should update know" do
    patch :update, id: @know, know: { descripcion: @know.descripcion, name: @know.name }
    assert_redirected_to know_path(assigns(:know))
  end

  test "should destroy know" do
    assert_difference('Know.count', -1) do
      delete :destroy, id: @know
    end

    assert_redirected_to knows_path
  end
end
