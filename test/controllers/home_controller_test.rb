require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get blog" do
    get home_blog_url
    assert_response :success
  end

  test "should get keyword" do
    get home_keyword_url
    assert_response :success
  end
end
