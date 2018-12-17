require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { balance: @project.balance, brief: @project.brief, company_id: @project.company_id, completed_on: @project.completed_on, deadline: @project.deadline, deposit: @project.deposit, is_complete: @project.is_complete, max_user_shot_list: @project.max_user_shot_list, package_type_id: @project.package_type_id, price: @project.price, title: @project.title } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { balance: @project.balance, brief: @project.brief, company_id: @project.company_id, completed_on: @project.completed_on, deadline: @project.deadline, deposit: @project.deposit, is_complete: @project.is_complete, max_user_shot_list: @project.max_user_shot_list, package_type_id: @project.package_type_id, price: @project.price, title: @project.title } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
