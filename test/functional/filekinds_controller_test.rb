require 'test_helper'

class FilekindsControllerTest < ActionController::TestCase
  setup do
    @filekind = filekinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filekinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filekind" do
    assert_difference('Filekind.count') do
      post :create, :filekind => @filekind.attributes
    end

    assert_redirected_to filekind_path(assigns(:filekind))
  end

  test "should show filekind" do
    get :show, :id => @filekind.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @filekind.to_param
    assert_response :success
  end

  test "should update filekind" do
    put :update, :id => @filekind.to_param, :filekind => @filekind.attributes
    assert_redirected_to filekind_path(assigns(:filekind))
  end

  test "should destroy filekind" do
    assert_difference('Filekind.count', -1) do
      delete :destroy, :id => @filekind.to_param
    end

    assert_redirected_to filekinds_path
  end
end
