require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
    @user   = users(:mark)
  end

  test "should get new" do
    log_in_as(@user)
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    log_in_as(@user)
    assert_difference('Course.count') do
      post courses_url, params: { course: { course_name: @course.course_name } }
    end

    assert_response :found
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    log_in_as(@user)
    patch course_url(@course), params: { course: { course_name: @course.course_name } }
    assert_response :found
  end

  test "should destroy course" do
    log_in_as(@user)
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_response :found
  end
end
