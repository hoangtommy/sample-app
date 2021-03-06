require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tester)
    @user2 = users(:tester2)
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url                                            
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when logged in as different user" do
    log_in_as(@user2)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as different user" do
    log_in_as(@user2)
    patch user_path(@user), params: { user: { name: @user.name, 
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should not allow admin attribute to be edited" do
    log_in_as(@user2)
    assert_not @user2.admin?
    patch user_path(@user2), params: { 
                               user: { password: @user2.password,
                                       password_confirmation: @user2.password,
                                       admin: true } }
    assert_not @user2.admin?
  end

  test "should redirect destroy if not logged in" do
    assert_no_difference 'User.count' do 
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as non-admin" do
    log_in_as(@user2)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end
end
