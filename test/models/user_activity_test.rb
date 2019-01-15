require 'test_helper'

class UserActivityTest < ActiveSupport::TestCase
  test 'Create User Activity Without User' do
    @company  = Company.create_default_for_tests
    @user_activity = UserActivity.new
    @user_activity.user = nil
    @user_activity.activity_type = UserActivityType.collection_added
    @user_activity.object_id = 1
    assert_not @user_activity.save, 'Saved without a user'
  end

  test 'Create user Activity Without Activity Type' do
    @company  = Company.create_default_for_tests
    @user_activity = UserActivity.new
    @user_activity.user = @company.users.first
    @user_activity.activity_type = nil
    @user_activity.object_id = 1
    assert_not @user_activity.save, 'Saved without a User Activity Type'
  end

  test 'Create user Activity Without Object ID' do
    @company  = Company.create_default_for_tests
    @user_activity = UserActivity.new
    @user_activity.user = @company.users.first
    @user_activity.activity_type = UserActivityType.collection_added
    @user_activity.object_id = nil
    assert_not @user_activity.save, 'Saved without a User Activity Object Id'

  end

  test 'Create User Activity With all fields' do
    @company  = Company.create_default_for_tests
    @user_activity = UserActivity.new
    @user_activity.user = @company.users.first
    @user_activity.activity_type = UserActivityType.collection_added
    @user_activity.object_id = 1
    assert @user_activity.save, 'Did not save with all required fields'
  end

  test 'User Activity Has Relationships' do
    @company  = Company.create_default_for_tests
    @user_activity = UserActivity.new
    @user_activity.user = @company.users.first
    @user_activity.activity_type = UserActivityType.collection_added
    @user_activity.object_id = 1
    @user_activity.save!

    assert_equal @company.users.first, @user_activity.user, 'the users for this activy are not equal'
  end
end
