require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:tolase)
    @project = projects(:orange)
    @comment = Comment.new(body: "test comment", user: @user, commentable: @project)
  end

  test "should be valid" do
    assert @comment.valid?
  end
end
