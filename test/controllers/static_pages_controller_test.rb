require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get addNewBus" do
    get :addNewBus
    assert_response :success
  end

  test "should get contactUs" do
    get :contactUs
    assert_response :success
  end

end
