require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "", email: "lashe@foobar.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "length must not be more than 15" do
    @user.username = "a" * 16
    assert_not @user.valid?
  end

  test "username length must not be less that 3" do
    @user.username = "a" * 2
    assert_not @user.valid?
  end

  # test "usernames should be lowcase" do
  #   mixed_case_username = "tOlASe"
  #   @user.username = mixed_case_username
  #   @user.save
  #   assert_equal mixed_case_username.downcase, @user.reload.username
  # end

  test "usernames should be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = "tolase"
    @user.username = "tolase"
    @user.save
    assert_not duplicate_user.valid?
  end

  test "should set display name to username if display name isn't present" do
    @user.username = "lashe"
    @user.display_name = ""
    @user.save
    assert_equal @user.username.humanize, @user.display_name
  end

end
