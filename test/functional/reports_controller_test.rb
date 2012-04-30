require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get shipped" do
    get :shipped
    assert_response :success
  end

  test "should get part_shipped" do
    get :part_shipped
    assert_response :success
  end

  test "should get in_production" do
    get :in_production
    assert_response :success
  end

end
