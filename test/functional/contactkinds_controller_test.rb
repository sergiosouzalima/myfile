require 'test_helper'

class ContactkindsControllerTest < ActionController::TestCase
  setup do
    @contactkind = contactkinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contactkinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contactkind" do
    assert_difference('Contactkind.count') do
      post :create, :contactkind => @contactkind.attributes
    end

    assert_redirected_to contactkind_path(assigns(:contactkind))
  end

  test "should show contactkind" do
    get :show, :id => @contactkind.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contactkind.to_param
    assert_response :success
  end

  test "should update contactkind" do
    put :update, :id => @contactkind.to_param, :contactkind => @contactkind.attributes
    assert_redirected_to contactkind_path(assigns(:contactkind))
  end

  test "should destroy contactkind" do
    assert_difference('Contactkind.count', -1) do
      delete :destroy, :id => @contactkind.to_param
    end

    assert_redirected_to contactkinds_path
  end
end
