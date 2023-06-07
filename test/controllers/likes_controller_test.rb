require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user =     users(:tolase)
    @project =  projects(:orange)
  end

  test "should redirect when not logged in" do
    assert_no_difference 'Like.count' do
      post likes_path, params: { like: { likeable: @project, likeable_type: "Project" } }
    end
    assert_not flash.empty?
  end
end
