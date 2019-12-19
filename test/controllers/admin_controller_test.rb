require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get echart" do
    get admin_echart_url
    assert_response :success
  end

  test "should get order" do
    get admin_order_url
    assert_response :success
  end

end
