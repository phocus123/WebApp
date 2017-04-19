require 'test_helper'

class UserCourseControllerTest < ActionDispatch::IntegrationTest
  test "should get user_id:int" do
    get user_course_user_id:int_url
    assert_response :success
  end

  test "should get course_id:int" do
    get user_course_course_id:int_url
    assert_response :success
  end

end
