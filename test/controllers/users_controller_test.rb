require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(first_name: "Chris", last_name: "Doe", username: "username", password: "qwerty")
    @user1   = users(:mark)
  end

  test "should get show" do
  	user = users(:mark)
    get user_url(user)
  	assert_response :found
  end

  test "should get new" do
    log_in_as(@user1)
    get new_user_url
    assert_response :success
  end

  test "should get edit" do
    user = users(:mark)
    log_in_as(@user1)
    get edit_user_url(user)
    assert_response :success
  end

  test "should destroy user" do
    user = users(:mark)
    log_in_as(@user1)
    assert_difference('User.count', -1) do
      delete user_url(user)
    end

    assert_response :found
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first_name should be present" do
  	@user.first_name = "     "
  	assert_not @user.valid?
  end

  test "last_name should be present" do
  	@user.last_name = "     "
  	assert_not @user.valid?
  end

  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "password should be present" do
  	@user.password = "     "
  	assert_not @user.valid?
  end

  test "username should be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
