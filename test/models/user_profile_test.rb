require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  test "Create A User Profile Without A User " do
    @profile = UserProfile.new
    @profile.user = nil
    @profile.display_name = "Testy Mc Tester"
    assert_not @profile.save, 'Profile Was Saved Without a user '
  end

  test "Create A User Profile Without A display name" do
    @company = Company.create_default_for_tests

    @profile = UserProfile.new
    @profile.user = @company.users.first
    @profile.display_name = nil
    assert_not @profile.save, 'Profile Was Saved Without a display name '
  end

  test "Create A User Profile With all required fields " do
    @company = Company.create_default_for_tests

    @profile = UserProfile.new
    @profile.user = @company.users.first
    @profile.display_name = "Testy Test"
    assert @profile.save, 'Profile Was Not Saved With al required fields.'
  end

  test "User profile has relationships" do
    @company = Company.create_default_for_tests

    @profile = UserProfile.new
    @profile.user = @company.users.first
    @profile.display_name = "Testy Test"
    @profile.save

    assert_equal @company.users.first, @profile.user, 'the user and profile are mismatched'
  end

  test "UserProfile::ClassMethod -> default_profile_image" do
    assert_equal UserProfile.default_profile_image, 'https://s3-us-west-2.amazonaws.com/nomcre/assets/Dummy-profile-picture.png', 'the default image was expected'
  end

  test "UserProfile::ClassMethod -> default_header_image" do
    assert_equal UserProfile.default_header_image, "https://s3-us-west-2.amazonaws.com/nomcre/assets/Dark-Background-6G.jpg" , 'the default image was expected'
  end

  test "UserProfile::InstanceMethod -> safe_profile_image_url" do
     @company = Company.create_default_for_tests

    @profile = UserProfile.new
    @profile.user = @company.users.first
    @profile.display_name = "Testy Test"
    @profile.save

    assert_equal @profile.safe_profile_image_url, 'https://s3-us-west-2.amazonaws.com/nomcre/assets/Dummy-profile-picture.png', 'the default image was expected'
  end

  test "UserProfile::ClassMethod -> safe_header_image_url" do
    @company = Company.create_default_for_tests

    @profile = UserProfile.new
    @profile.user = @company.users.first
    @profile.display_name = "Testy Test"
    @profile.save

    assert_equal @profile.safe_header_image_url, "https://s3-us-west-2.amazonaws.com/nomcre/assets/Dark-Background-6G.jpg" ,'the default image was expected'

  end
end
