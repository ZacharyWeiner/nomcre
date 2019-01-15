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
    @task = Task.new
    @task.user = @creative
    @task.description = 'Some new task'
    @task.deadline = Date.today + 5.days
    @task.company = @company
    @task.shoot = @shoot
    @task.project = @project
    @task.shot_list_item = @shot_list_item

    assert_equal @project, @task.project, 'task should have relationship to the correct project'
  end

  test 'Task::InstanceMethod -> try complete' do
    @task = Task.new
    @task.user = @creative
    @task.description = 'Some new task'
    @task.deadline = Date.today + 5.days
    @task.company = @company
    @task.shoot = @shoot
    @task.project = @project
    @task.completed = false
    @task.shot_list_item = @shot_list_item
    @task.save!

    assert @task.try_complete, 'should be able to complete the task'
  end

  test 'Task::InstanceMethod -> approver' do
    @task = Task.new
    @task.user = @creative
    @task.description = 'Some new task'
    @task.deadline = Date.today + 5.days
    @task.company = @company
    @task.shoot = @shoot
    @task.project = @project
    @task.completed = true
    @task.shot_list_item = @shot_list_item
    @task.can_accept = 'creative'
    @task.save!
    @task.reload
    assert @task.approver, 'task should have an approver'
  end

  test 'Task::InstanceMethod -> try_complete_shoot' do
    @shoot.tasks.each do |t|
      t.try_complete
    end
    @task = Task.new
    @task.user = @creative
    @task.description = 'Some new task'
    @task.deadline = Date.today + 5.days
    @task.company = @company
    @task.shoot = @shoot
    @task.project = @project
    @task.completed = true
    @task.shot_list_item = @shot_list_item
    @task.can_accept = 'creative'
    @task.save!

    assert @task.try_complete_shoot, 'Implement Complete field for shoot'

  end

  test 'Task::InstanceMethod -> try_complete_project' do

    @task = Task.new
    @task.user = @creative
    @task.description = 'Some new task'
    @task.deadline = Date.today + 5.days
    @task.company = @company
    @task.shoot = @shoot
    @task.project = @project
    @task.completed = true
    @task.shot_list_item = @shot_list_item
    @task.can_accept = 'creative'
    @task.save!

    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!

    @project.project_tasks.each do |pt|
      pt.completed = true
      pt.save!
    end

    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.deposit
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 5000
    @payment.save!


    @invoice = @project.invoices.first
    @invoice.payment = @payment
    @invoice.save!

    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.balance
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 5000
    @payment.save!

    @invoice = @project.invoices.last
    @invoice.payment = @payment
    @invoice.save!

    @project.reload


    assert @task.try_complete_project, 'Should be able to complete the project'
  end
end
