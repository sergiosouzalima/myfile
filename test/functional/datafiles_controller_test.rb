require 'test_helper'

class DatafilesControllerTest < ActionController::TestCase
  setup do
    @datafile = datafiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datafiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datafile" do
    assert_difference('Datafile.count') do
      post :create, :datafile => @datafile.attributes
    end

    assert_redirected_to datafile_path(assigns(:datafile))
  end

  test "should show datafile" do
    get :show, :id => @datafile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @datafile.to_param
    assert_response :success
  end

  test "should update datafile" do
    put :update, :id => @datafile.to_param, :datafile => @datafile.attributes
    assert_redirected_to datafile_path(assigns(:datafile))
  end

  test "should destroy datafile" do
    assert_difference('Datafile.count', -1) do
      delete :destroy, :id => @datafile.to_param
    end

    assert_redirected_to datafiles_path
  end
end
