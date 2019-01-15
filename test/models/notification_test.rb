require 'test_helper'
include Rails.application.routes.url_helpers

class NotificationTest < ActiveSupport::TestCase
  #TODO: Create a Notification of Each Type and test that the correct user can see them
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @chatroom = Chatroom.create_for_shoot({topic: "Chatroom for shoot: #{@shoot.id}", shoot_id: @shoot.id})
  end

  test 'Create a Notification for a Without a user ' do
    @notification = Notification.new
    @notification.user = nil
    @notification.notification_object_id = @shoot.object_id
    @notification.notification_type = NotificationType.new_work_request

    assert_not @notification.save, 'Saved without a user '

    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @company.users.first.destroy!
    @package_type.destroy!
  end

  test 'Create a Notification for a Without an object_id ' do
    @notification = Notification.new
    @notification.user = @company.users.first
    @notification.notification_object_id = nil
    @notification.notification_type = NotificationType.new_work_request

    assert_not @notification.save, 'Saved without an object_id '

    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @company.users.first.destroy!
    @package_type.destroy!
  end

  test 'Create a Notification for a Without a notification_type ' do
    @notification = Notification.new
    @notification.user = @user
    @notification.notification_object_id = @shoot.object_id
    @notification.notification_type = nil

    assert_not @notification.save, 'Saved without a notification_type '

    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @company.users.first.destroy!
    @package_type.destroy!
  end

  test 'Create a Notification for a Task' do
    @task = Task.create_for_shoot @shoot.id
    @notification = Notification.create!(notification_type: NotificationType.task,
                                        notification_object_id: @task.id,
                                        user: @company.users.first)

    assert_equal @notification.notification_object_id, @task.id, 'notification.object != task'
    assert_equal @notification.notification_type, NotificationType.task, 'notification_type != notification_type'
    assert_equal @notification.user, @company.users.first, 'notification.user != user'

    assert_equal "/tasks/#{@task.id}", @notification.construct_link, 'the link was not equal for notifiction type task'

    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @company.users.first.destroy!
    @package_type.destroy!
  end

  test 'Create a Notification for a Message' do

    result = Message.create_with_notification({chatroom_id: @chatroom.id, content: 'A cool message', user_id: @company.users.first.id})
    @creative = User.create!(name: 'Super Creative', email: 'creative@creative.com', password: 'password', password_confirmation: 'password')
    result = Message.create_with_notification({chatroom_id: @chatroom.id, content: 'A cool message', user_id: @creative.id})

    @message = result[0]
    @notifications = result[1]
    @notification = @notifications[0]

    assert_equal @notification.notification_object_id, @message.id, 'notification.object != message'
    assert_equal @notification.notification_type, NotificationType.new_message, 'notification_type != notification_type'
    assert_equal @notification.user, @company.users.first, 'notification.user != user'
    assert_equal "/chatrooms/#{@chatroom.id}", @notification.construct_link, 'the link was not equal for notifiction type message'

    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @company.users.first.destroy!
    @package_type.destroy!
  end

  test 'Create a Notification for a New Creative request' do
    @creative = User.create!(name: 'Super Creative', email: 'creative@creative.com', password: 'password', password_confirmation: 'password')
    @creative_request = CreativeRequest.create_for_shoot(creative_id: @creative.id, shoot_id: @shoot.id)

    @notification = Notification.all.last

    assert_equal @notification.notification_object_id, @creative_request.id, 'crative request id and notification object id dont match'
    assert_equal @notification.notification_type, NotificationType.new_work_request, 'Notification Type is incorrect'
    assert_equal @notification.user.id, @creative_request.creative_id, 'crative request user and notification user  dont match'

    assert_equal "/creative_requests", @notification.construct_link, 'the link was not equal for notifiction type message'
    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @package_type.destroy!
  end

  test 'Create a Notification for a New Work Accepted' do
    @creative = User.create!(name: 'Super Creative', email: 'creative@creative.com', password: 'password', password_confirmation: 'password')
    @creative_request = CreativeRequest.create_for_shoot(creative_id: @creative.id, shoot_id: @shoot.id)
    @creative_request.accept
    @notification = Notification.all.last

    assert_equal @notification.notification_object_id, @shoot.id, 'crative request id and notification object id dont match'
    assert_equal @notification.notification_type, NotificationType.request_accepted, 'Notification Type is incorrect'
    assert_equal @notification.user.id, @company.users.first.id, 'crative request user and notification user  dont match'

    assert_equal "/shoots/#{@shoot.id}", @notification.construct_link, 'the link was not equal for notifiction type message'
    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @package_type.destroy!

  end


  test 'Create a Notification for New Work Assigned' do
    @creative = User.create!(name: 'Super Creative', email: 'creative@creative.com', password: 'password', password_confirmation: 'password')
    @creative.user_profile = UserProfile.create(user: @creative, display_name: @creative.name)
    @creative_request = CreativeRequest.create_for_shoot(creative_id: @creative.id, shoot_id: @shoot.id)
    @creative_request.accept
    @shoot.assign_from_request @creative_request.id

    @notification = Notification.all.last

    assert_equal @notification.notification_object_id, @shoot.id, 'crative request id and notification object id dont match'
    assert_equal @notification.notification_type, NotificationType.request_assigned, 'Notification Type is incorrect'
    assert_equal @notification.user.id, @creative.id, 'crative request user and notification user  dont match'
    assert_equal "/shoots/#{@shoot.id}", @notification.construct_link, 'the link was not equal for notifiction type message'
  end

  test 'Create a Notification for a Work Declined' do
    @creative = User.create!(name: 'Super Creative', email: 'creative@creative.com', password: 'password', password_confirmation: 'password')
    @creative.user_profile = UserProfile.create(user: @creative, display_name: @creative.name)
    @creative_request = CreativeRequest.create_for_shoot(creative_id: @creative.id, shoot_id: @shoot.id)
    @creative_request.decline

    @notification = Notification.all.last

    assert_equal @notification.notification_object_id, @shoot.id, 'crative request id and notification object id dont match'
    assert_equal @notification.notification_type, NotificationType.request_declined, 'Notification Type is incorrect'
    assert_equal @notification.user.id, @company.users.first.id, 'crative request user and notification user  dont match'
    assert_equal "/creative_requests", @notification.construct_link, 'the link was not equal for notifiction type message'

  end


  test 'Create a Notification for Payment Made' do
    @payment = Payment.create_with_notification({user_id: @company.users.first.id, project_id: @project.id, payment_type: PaymentType.deposit, payment_method: PaymentMethod.credit_card, paid_on: Date.today})

    @notification = Notification.all.last

    assert_equal @notification.notification_object_id, @payment.id, 'crative request id and notification object id dont match'
    assert_equal @notification.notification_type, NotificationType.payment_made, 'Notification Type is incorrect'
    assert_equal @notification.user.id, @company.users.first.id, 'crative request user and notification user  dont match'
    assert_equal "/payments/#{@payment.id}", @notification.construct_link, 'the link was not equal for notifiction type message'
    assert       @company.users.first.notifications.include?(@notification), 'The users notifications does not have the expected notification'
  end

  test 'A Notification can be marked as read' do
    @payment = Payment.create_with_notification({user_id: @company.users.first.id, project_id: @project.id, payment_type: PaymentType.deposit, payment_method: PaymentMethod.credit_card, paid_on: Date.today})

    @notification = Notification.all.last
    @notification.mark_read

    assert @notification.read
    assert_equal @notification.notification_object_id, @payment.id, 'crative request id and notification object id dont match'
    assert_equal @notification.notification_type, NotificationType.payment_made, 'Notification Type is incorrect'
    assert_equal @notification.user.id, @company.users.first.id, 'crative request user and notification user  dont match'
    assert_equal "/payments/#{@payment.id}", @notification.construct_link, 'the link was not equal for notifiction type message'
    assert       @company.users.first.notifications.include?(@notification), 'The users notifications does not have the expected notification'
  end

  test 'Model::Method - Mark all as read for user' do
    @note1 = Notification.create!(user_id: @company.users.first.id, notification_type: NotificationType.task, notification_object_id: 1)
    @note2 = Notification.create!(user_id: @company.users.first.id, notification_type: NotificationType.task, notification_object_id: 1)
    @note3 = Notification.create!(user_id: @company.users.first.id, notification_type: NotificationType.task, notification_object_id: 1)
    @note4 = Notification.create!(user_id: @company.users.first.id, notification_type: NotificationType.task, notification_object_id: 1)
    @note5 = Notification.create!(user_id: @company.users.first.id, notification_type: NotificationType.task, notification_object_id: 1)

    assert !@note1.read, 'The notification should not be ead yet'
    assert !@note2.read, 'The notification should not be ead yet'
    assert !@note3.read, 'The notification should not be ead yet'
    assert !@note4.read, 'The notification should not be ead yet'
    assert !@note5.read, 'The notification should not be ead yet'

    Notification.mark_all_read_for_user @company.users.first.id

    assert @note1.reload().read, 'The notification should be read'
    assert @note2.reload().read, 'The notification should be read'
    assert @note3.reload().read, 'The notification should be read'
    assert @note4.reload().read, 'The notification should be read'
    assert @note5.reload().read, 'The notification should be read'

  end

  test 'Model::Method check notifications' do
    @note1 = Notification.create!(user_id: @company.users.first.id, notification_type: NotificationType.task, notification_object_id: 1)
    Notification.check_notifications @company.users.first.id, NotificationType.task, 1
    @note1.reload()
    assert @note1.read
  end
end
