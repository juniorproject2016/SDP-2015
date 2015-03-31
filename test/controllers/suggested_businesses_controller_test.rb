require 'test_helper'

class SuggestedBusinessesControllerTest < ActionController::TestCase
  setup do
    @suggested_business = suggested_businesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suggested_businesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suggested_business" do
    assert_difference('SuggestedBusiness.count') do
      post :create, suggested_business: { business_name: @suggested_business.business_name, requester: @suggested_business.requester }
    end

    assert_redirected_to suggested_business_path(assigns(:suggested_business))
  end

  test "should show suggested_business" do
    get :show, id: @suggested_business
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suggested_business
    assert_response :success
  end

  test "should update suggested_business" do
    patch :update, id: @suggested_business, suggested_business: { business_name: @suggested_business.business_name, requester: @suggested_business.requester }
    assert_redirected_to suggested_business_path(assigns(:suggested_business))
  end

  test "should destroy suggested_business" do
    assert_difference('SuggestedBusiness.count', -1) do
      delete :destroy, id: @suggested_business
    end

    assert_redirected_to suggested_businesses_path
  end
end
