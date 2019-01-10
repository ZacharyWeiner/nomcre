require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @chatroom = Chatroom.create_for_shoot({topic: "Chatroom for shoot: #{@shoot.id}", shoot_id: @shoot.id})
  end

  test "Create A Message Without a Chatroom" do

    @message = Message.new
    @message.content = "This is a cool new message"
    @message.user = @company.users.first
    @message.chatroom = nil

    assert_not @message.save, "Saved the message without a chatroom"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
    @package_type.destroy!
  end

  test "Create A Message Without a User" do

    @message = Message.new
    @message.content = "This is a cool new message"
    @message.user = nil
    @message.chatroom = @chatroom

    assert_not @message.save, "Saved the message without a user"

    @chatroom.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
    @package_type.destroy!
  end

  test "Create A Message With all requried fields" do

    @message = Message.new
    @message.content = "This is a cool new message"
    @message.user = @company.users.first
    @message.chatroom = @chatroom

    assert @message.save, "Couldnt Save the message with al required fields"
    assert_equal @message.chatroom, @chatroom, 'message.chatroom != @chatroom'
    assert @chatroom.messages.include?(@message), 'chatroom.message ! inlude @message'
    assert_equal @message.user, @company.users.first, 'message.user != @company.users.first'
    assert_equal @message.content, "This is a cool new message", 'message.content != the content'

    @chatroom.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
    @package_type.destroy!
  end

  test "Message create_with_notification" do
    @message = Message.create_with_notification({user_id: @company.users.first.id, content: 'This is a test message', chatroom_id: @chatroom.id})
    assert @company.users.first.notifications.count > 0, 'the message should have caused a notification to be broadcast'
  end

end
