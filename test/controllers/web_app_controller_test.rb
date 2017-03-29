require 'test_helper'

class WebAppControllerTest < ActionDispatch::IntegrationTest
  test "should get landing" do
    get web_app_landing_url
    assert_response :success
  end

end
