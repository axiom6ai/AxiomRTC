require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get live" do
    get static_pages_live_url
    assert_response :success
  end

end
