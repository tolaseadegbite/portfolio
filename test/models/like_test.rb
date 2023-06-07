require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = users(:tolase)
    @project = projects(:orange)
    @like = @user.likes.build(likeable: @project, likeable_type: 'Project')
    sign_in @user
  end

  test "should be valid" do
    assert @like.valid?
  end

  test "user_id should be present" do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test "likeable should be present" do
    @like.likeable = nil
    assert_not @like.valid?
  end

  # test "uniqueness of user_id on likeable" do
  #   dup_like_user = @like.user.dup
  #   @like.save
  #   assert_not dup_like_user.valid?
  # end
end
