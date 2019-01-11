require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')
    @shot_list_item = ShotListItem.create_for_shoot(@shoot.id)
  end

  #TODO: Write All Test for Task Properties
  test 'Create A Task And check relationships' do
    @task = Task.new
    @task.user = @creative
    @task.description = 'Some new task'
    @task.deadline = Date.today + 5.days
    @task.company = @company
    @task.shoot = @shoot
    @task.project = @project
    @task.shot_list_item = @shot_list_item


    assert @task.save, 'Task did not save with all fields'
    assert_equal @task.user, @creative, 'task.user != creative'
    assert_equal @task.company, @company, 'task.company != company'
    assert_equal @task.shoot, @shoot, 'task.shoot != shoot'
    assert_equal @task.project, @project, 'task.project != project'
    assert_equal @task.shot_list_item, @shot_list_item, 'task.shot_list_item != shot_list_item'

    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test 'Task::InstanceMethod -> project' do
    assert false
  end

  test 'Task::InstanceMethod -> try complete' do
    assert false
  end

  test 'Task::InstanceMethod -> approver' do
    assert false
  end

  test 'Task::InstanceMethod -> try_complete_shoot' do
    assert false
  end

  test 'Task::InstanceMethod -> try_complete_project' do
    assert false
  end

  test 'Task::InstanceMethod -> create_for_shoot' do
    assert false
  end

  test 'Task::InstanceMethod -> create_for_project' do
    assert false
  end
end
