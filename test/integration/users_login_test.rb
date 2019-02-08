require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  test "invalid login" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "test@test.co", password: "nottherightpassword" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  # test "valid login" do
  #   get login_path
  #   assert_template 'sessions/new'
  #   post login_path, params: { sessions: { email: "test@test.com", password: "Hello123" } }
  #   assert_template ''
  #   assert_not flash.empty?
  # end
end
