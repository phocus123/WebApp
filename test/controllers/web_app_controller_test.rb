require 'test_helper'

class WebAppControllerTest < ActionDispatch::IntegrationTest
  test "should get landing" do
    get home_url
    assert_response :success
  end

end
