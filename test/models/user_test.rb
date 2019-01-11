require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    #@package_type = PackageType.create_default_for_tests
    #@company = Company.create_default_for_tests
    #@project = Project.create_default_for_tests @package_type.id, @company.id
    #@location = Location.create_default_for_tests
    #@shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    #@creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')
  end

  #TODO: Write Tests for Users
  test "User has a company" do
    @company = Company.create_default_for_tests
    assert @company.users.count > 0, 'user should have a company'

    @user = @company.users.first
    assert @user.company == @company

    @company.destroy!
  end

  test "User has a user_profile" do
    @company = Company.create_default_for_tests
    @user = @company.users.first
    assert @user.user_profile.id > 0, 'the user does not have a profile'
    assert_equal @user.user_profile.display_name, @user.name, 'the user does not have a profile'
    @company.destroy!
  end

  test "User has collections" do
    @collections = []
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    @collections << Collection.create!(user_id: @creative.id, title: 'Testy testerson', description: 'this is a description of 1')
    @collections << Collection.create!(user_id: @creative.id, title: 'Testy testerson 2', description: 'this is a description of 2')

    assert_equal @creative.collections.count, 2, 'user should have 2 collections'
    @collections.each do |c|
      c.destroy!
    end
    @creative.destroy!
  end

  test "User has collection items" do
    @collection_items = []
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    @collection1 = Collection.create!(user_id: @creative.id, title: 'Testy testerson', description: 'this is a description of 1')

    @collection_items << CollectionItem.create!(user: @creative, collection:@collection1, file: 'www.google.com/iamge1.png', item_type: 'photo', is_header: false)
    @collection_items << CollectionItem.create!(user: @creative, collection:@collection1, file: 'www.google.com/iamge2.png', item_type: 'photo', is_header: false)

    assert_equal @creative.collection_items.count, 2, 'user should have 2 collection items'
    @collection1.destroy!
    @creative.destroy!
  end

  test "User has tasks" do
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    @task1 = Task.create!(user: @creative, description: 'a task', deadline: Date.today + 60.days, can_accept: 'creative')
    @task2 = Task.create!(user: @creative, description: 'a task 2', deadline: Date.today + 60.days, can_accept: 'creative')

    assert @creative.tasks.count == 2, 'the user should have 2 tasks'
    @task2.destroy!
    @task1.destroy!
    @creative.destroy!
  end

  test "User has messages and chatrooms" do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    @chatroom = Chatroom.create!(topic: 'A Test Room', shoot: @shoot)
    @message1 = Message.create!(content: "some silly message", user: @creative, chatroom: @chatroom)
    @message1 = Message.create!(content: "a second less silly message", user: @creative, chatroom: @chatroom)

    #assert_equal 1, @creative.chatrooms.count, 'the user should have 1 chatroom'
    assert_equal 2,  @creative.messages.count, 'the user should have 2 messages'
  end

  test "User has notifications" do
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)

    @notification = Notification.create!(user_id: @creative.id, notification_type: NotificationType.new_work_request, notification_object_id: 1)
    assert @creative.notifications.count > 0, 'user should have a notification'
  end

  test "User has schedule_items" do
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    @schedule_items = []
    @location = Location.create_default_for_tests
    @schedule_items << ScheduleItem.create!(user: @creative, location_id: Location.first.id, start_date: Date.today, end_date: Date.today + 60.days )
    @schedule_items << ScheduleItem.create!(user: @creative, location_id: Location.last.id, start_date: Date.today + 60.days, end_date: Date.today + 90.days )
    assert_equal 2, @creative.schedule_items.count, 'user should have 2 schedule items'
  end

  test "User has shoots" do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)

    @shoot.creative = @creative
    @shoot.save!

    assert_equal @shoot, @creative.shoots.first
  end

  test "User has projects" do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @location = Location.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)

    @shoot.creative = @creative
    @shoot.save!


    assert_equal 1, @creative.projects.count, 'users hould have 1 projects in the collection'
  end

  test "User has documents" do
   @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @location = Location.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)

    @shoot.creative = @creative
    @shoot.save!

    Document.create_document_for_shoot @shoot.id
    assert_equal 1, @company.users.first.documents.count, 'comapny user should have 1 document'
  end

  test "User has creative_requests" do
   @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @location = Location.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)

    @creative_request = CreativeRequest.create_for_shoot(creative_id: @creative.id, shoot_id: @shoot.id)

    assert_equal 1, @creative.creative_requests.count, 'Creative should have 1 creative request'
  end

  test "User::InstanceMethod -> pending_requests" do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @location = Location.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)

    @creative_request = CreativeRequest.create_for_shoot(creative_id: @creative.id, shoot_id: @shoot.id)

    assert_equal 1, @creative.pending_requests.count, 'Creative should have 1 creative request'
  end

  test "User::InstanceMethod -> assigned_requests" do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @location = Location.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)

    @creative_request = CreativeRequest.create_for_shoot(creative_id: @creative.id, shoot_id: @shoot.id)
    @creative_request.accept
    @shoot.assign_from_request @creative_request.id

    assert_equal 1, @creative.assigned_requests.count, 'Creative should have 1 assigned request'
  end

  test "User::InstanceMethod -> accepted_requests" do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @location = Location.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)

    @creative_request = CreativeRequest.create_for_shoot(creative_id: @creative.id, shoot_id: @shoot.id)
    @creative_request.accept

    assert_equal 1, @creative.accepted_requests.count, 'Creative should have 1 accepted request'
  end

  test "User::InstanceMethod -> user_activities" do
    @collections = []
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    @collections << Collection.create_with_activity({user_id: @creative.id, title: 'Testy testerson', description: 'this is a description of 1'})
    @collections << Collection.create_with_activity({user_id: @creative.id, title: 'Testy testerson 2', description: 'this is a description of 2'})

    assert_equal 2 ,@creative.user_activities.count, 'user should have 2 user_activities'
    @collections.each do |c|
      c.destroy!
    end
    @creative.destroy!
  end

  test "User::InstanceMethod -> is_admin" do
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    assert_equal false, @creative.is_admin, 'creative should not be an admin'

    @creative.role = 0
    @creative.save!
    assert @creative.is_admin, 'creative should be an admin'
  end

  test "User::InstanceMethod -> check_profile_complete" do
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    assert_equal false, @creative.check_profile_complete, 'profile should not be complete'
  end

  test "User::InstanceMethod -> check_schedule_added" do
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    assert_equal false, @creative.check_schedule_added, 'user should not have a schedule item added yet'
    @schedule_items = []
    @location = Location.create_default_for_tests
    @schedule_items << ScheduleItem.create!(user: @creative, location_id: Location.first.id, start_date: Date.today, end_date: Date.today + 60.days )
    @schedule_items << ScheduleItem.create!(user: @creative, location_id: Location.last.id, start_date: Date.today + 60.days, end_date: Date.today + 90.days )
    assert_equal true, @creative.check_schedule_added, 'user should have a schedule item added'
  end

  test "User::InstanceMethod -> check_collection_added" do
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password', user_type: UserType.creative)
    assert_equal false, @creative.check_collection_added, 'user should not have a collection'

    @collection =  Collection.create_with_activity({user_id: @creative.id, title: 'Testy testerson', description: 'this is a description of 1'})
    @collection_item = CollectionItem.create!(user: @creative, collection:@collection, file: 'www.google.com/iamge1.png', item_type: 'photo', is_header: false)
    assert_equal true, @creative.check_collection_added, 'user should have a collection added'

  end
end
