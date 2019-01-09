require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "Create A Company Without a Name" do
    @company = Company.new
    @company.name = nil
    @company.phone = '18889997766'
    @company.website = 'www.company.com'

    assert_not @company.save, "Saved the company without a name"
  end

   test "Create A Company Without a phone" do
    @company = Company.new
    @company.name = "Testy Company"
    @company.phone = nil
    @company.website = 'www.company.com'

    assert_not @company.save, "Saved the company without a phone"
  end

   test "Create A Company Without a website" do
    @company = Company.new
    @company.name = "Testy Company"
    @company.phone = '18889997766'
    @company.website = nil

    assert_not @company.save, "Saved the company without a name"
  end

  test "Create A Company With all fields" do
    @company = Company.new
    @company.name = "Testy Company"
    @company.phone = '18889997766'
    @company.website = 'www.testy.com'

    assert @company.save, "Saved the company without all fields"

    @company.destroy!
  end

   test "Company Has User" do
    @user = User.create!(name: 'Testy Mc Tester', email: 'Testy@mctester.com', password: 'password', password_confirmation: 'password')
    @company = Company.new
    @company.name = "Testy Company"
    @company.phone = '18889997766'
    @company.website = 'www.testy.com'
    @company.users << @user
    @company.save!

    assert_equal(@company.users.first, @user, "Company returns the user")

    @company.destroy!
    @user.destroy!
  end

  #TODO Create Tests for All Company Model Methods
  test "Company Has Pending Requests" do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')

    @creative_request = CreativeRequest.create_for_shoot(shoot_id: @shoot.id, creative_id: @creative.id)
    assert @creative_request
    assert @creative.notifications.count > 0
    assert @creative.user_activities.count > 0

    assert @company.pending_requests.count > 0

    assert @creative_request.destroy
    assert @shoot.destroy
    assert @project.destroy
    assert @location.destroy
    assert @company.destroy
    assert @creative.destroy
    assert @package_type.destroy
  end

  test "Company Has Accepted Requests" do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')

    @creative_request = CreativeRequest.create_for_shoot(shoot_id: @shoot.id, creative_id: @creative.id)
    @creative_request.accepted = true

    assert @creative_request.save
    assert @creative.notifications.count > 0
    assert @creative.user_activities.count > 0

    assert @company.accepted_requests.count > 0

    assert @creative_request.destroy
    assert @shoot.destroy
    assert @project.destroy
    assert @location.destroy
    assert @company.destroy
    assert @creative.destroy
    assert @package_type.destroy
  end

  test "Company deconstructs properly" do
     @company = Company.create_default_for_tests
     assert @company.destroy
  end

end
