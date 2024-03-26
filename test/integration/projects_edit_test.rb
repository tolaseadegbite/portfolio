require "test_helper"

class ProjectsEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @project = projects(:orange)
  end

  test "edit with invalid information" do
    sign_in @user
    get edit_project_path(@project)
    assert_template 'projects/edit'
    patch project_path(@project), params: { project: { title: "" } }
    assert_response :unprocessable_entity
    assert_template 'projects/edit'
    assert_select "div#error_explanation"
  end

  test "edit with valid information" do
    sign_in @user
    get edit_project_path(@project)
    assert_template 'projects/edit'
    title = "A new title"
    description = "A cool project"
    github_link = "www.link.com"
    patch project_path(@project), params: { project: { title: title, description: description, github_link: github_link } }
    assert_not flash.empty?
    assert_redirected_to @project
    @project.reload
    assert_equal title, @project.title
  end
end
