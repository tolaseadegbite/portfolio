require "test_helper"

class ProjectsCreationTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:tolase)
    @project = projects(:orange)
  end

  test "create with invalid information" do
    sign_in @user
    assert_no_difference 'Project.count' do
      post projects_path, params: { project: { title: "",
                                                github_link: "" } }
    end
    assert_response :unprocessable_entity
    assert_template "projects/new"
    assert_select "div#error_explanation"
  end

  test "create with valid information" do
    sign_in @user
    assert_difference 'Project.count', 1 do
      post projects_path, params: { project: { title: "My nice project",
                                                github_link: "https://www.example.com",
                                                description: "What a nice project" } }
    end
    follow_redirect!
    assert_template 'projects/show'
    assert_not flash.empty?
    
  end
end
