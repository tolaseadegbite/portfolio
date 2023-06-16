require "test_helper"

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = Tag.new(name: "Testing", category: "Blog")  
  end

  test "Tag is valid" do
    assert @tag.valid?
  end

  test "name must be present" do
    @tag.name = "   "
    assert_not @tag.valid?
  end

  test "category must be present" do
    @tag.category = "   "
    assert_not @tag.valid?
  end

  test "Name must not be less than 2" do
    @tag.name = "a"
    assert_not @tag.valid?
  end

  test "Name must not be more than 15" do
    @tag.name = "a" * 15 + "z"
    assert_not @tag.valid?
  end
end
