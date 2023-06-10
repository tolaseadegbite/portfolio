require "test_helper"

class LikesCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user =     users(:tolase)
    @project =  projects(:orange)
    sign_in @user
  end

  test "create like with invalid information" do
    assert_no_difference 'Like.count' do
      post likes_path, params: { like: { likeable: "", likeable_type: "" } }
    end
    assert_not flash.empty?
    # assert_redirected_to
  end

  test "create like with valid information" do
    assert_difference 'Like.count', 1 do
      post likes_path, params: { like: { likeable_id: @project.id, likeable_type: @project.class.to_s, user: @user } }
    end
    redirect_back(fallback_location: root_url)
  end
end
