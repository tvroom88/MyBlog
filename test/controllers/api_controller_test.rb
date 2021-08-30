require "test_helper"

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    get api_post_url
    assert_response :success
  end

  test "should get alarm_keyword" do
    get api_alarm_keyword_url
    assert_response :success
  end
end
