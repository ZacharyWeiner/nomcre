require 'test_helper'

class ChatroomTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
  end

  test "Create A Chatroom Without a Topic" do
    @chatroom = Chatroom.new
    @chatroom.shoot = @shoot

    assert_not @chatroom.save, "Saved the chatroom without a title"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end
  test "Create A Chatroom Without a Shoot" do
    @chatroom = Chatroom.new
    @chatroom.topic = "Testy topic"
    @chatroom.shoot = nil

    assert_not @chatroom.save, "Saved the chatroom without a shoot"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "Create A Chatroom With all fields" do
    @chatroom = Chatroom.new
    @chatroom.topic = "Testy topic"
    @chatroom.shoot = @shoot

    assert @chatroom.save, "Saved the chatroom without a title"

    @chatroom.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "Chatroom has message" do
    @chatroom = Chatroom.new
    @chatroom.topic = "Testy topic"
    @chatroom.shoot = @shoot
    @chatroom.save!
    @message = Message.create(chatroom: @chatroom, content: 'Test message', user: @company.users.first)

    assert_equal(@chatroom.messages.first, @message,  "Chatroom has the message")

    @chatroom.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "method create_for_shoot without a topic" do
    @chatroom = Chatroom.create_for_shoot({shoot_id: @shoot.id})
    assert !@chatroom.nil?, 'nil was returned instead of a chatroom'

    @chatroom.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "method create_for_shoot with a topic" do
    @chatroom = Chatroom.create_for_shoot({shoot_id: @shoot.id, topic: 'Something cool'})

    assert !@chatroom.nil?, 'nil was returned instead of a chatroom'
    assert @chatroom.topic == 'Something cool'

    @chatroom.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end
end
