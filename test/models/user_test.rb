require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #setup method gets ran before each test
  def setup
    @user = User.new(name: "Sample User", email: "sample@user.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = '    '
    assert @user.invalid?
    #same as assert_not @user.valid?

  end

  test "email should be present" do
    @user.email = ''
    assert @user.invalid?
  end

  test "name should not exceed 51 characters" do
    @user.name = "a" * 51
    assert @user.invalid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@hogwarts.com"
    assert @user.invalid?
  end
end
