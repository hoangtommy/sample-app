require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:tester)
  end
  
  test "failed edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), sparams: { user: { name: '',
                                              email: 'foo@none', 
                                              password: 'bar',
                                              password_confirmation: 'bor' } }
    assert_template 'users/edit'
    assert_select "div.alert", "The form contains 4 errors"
  end
end
