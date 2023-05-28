require "test_helper"

class UsernamesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tolase)
    sign_in (@user)
  end
  
  test "should get new" do
    get new_username_path
    assert_response :success
  end

  test "invalid username information" do
    get new_username_path
    assert_template 'usernames/new'
    patch username_path(@user), params: { user: { 
                                        username: ""
     } }
     follow_redirect!
     assert_template 'usernames/new'
  end

  test "valid username information" do
    get new_username_path
    assert_template 'usernames/new'
    username = "lashe"
    patch username_path(@user), params: { user: { 
                                        username: username
     } }
     assert_not flash.empty?
    assert_redirected_to root_url
    @user.reload
    assert_equal username, @user.username
  end
end
