require 'test_helper'

class CreativeRequestTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')
  end

  test "Create A Creative Request Without a Creative" do
    @creative_request = CreativeRequest.new
    @creative_request.creative = nil
    @creative_request.shoot = @shoot
    @creative_request.requested_by = @company.users.first
    @creative_request.company = @company
    @creative_request.accepted = false
    @creative_request.approved = false
    @creative_request.declined = false

    assert_not @creative_request.save, "Saved the creative_request without a creative"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request Without a shoot" do
    @creative_request = CreativeRequest.new
    @creative_request.creative = @creative
    @creative_request.shoot = nil
    @creative_request.requested_by = @company.users.first
    @creative_request.company = @company
    @creative_request.accepted = false
    @creative_request.approved = false
    @creative_request.declined = false

    assert_not @creative_request.save, "Saved the creative_request without a shoot"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request Without a requested_by" do
    @creative_request = CreativeRequest.new
    @creative_request.creative = @creative
    @creative_request.shoot = @shoot
    @creative_request.requested_by = nil
    @creative_request.company = @company
    @creative_request.accepted = false
    @creative_request.approved = false
    @creative_request.declined = false

    assert_not @creative_request.save, "Saved the creative_request without a requested_by"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request Without a Company" do
    @creative_request = CreativeRequest.new
    @creative_request.creative = @creative
    @creative_request.shoot = @shoot
    @creative_request.requested_by = @company.users.first
    @creative_request.company = nil
    @creative_request.accepted = false
    @creative_request.approved = false
    @creative_request.declined = false

    assert_not @creative_request.save, "Saved the creative_request without a company"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request Without a accepted" do
    @creative_request = CreativeRequest.new
    @creative_request.creative = @creative
    @creative_request.shoot = @shoot
    @creative_request.requested_by = @company.users.first
    @creative_request.company = @company
    @creative_request.accepted = nil
    @creative_request.approved = false
    @creative_request.declined = false

    assert_not @creative_request.save, "Saved the creative_request without a accepted"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request Without a approved" do
    @creative_request = CreativeRequest.new
    @creative_request.creative = @creative
    @creative_request.shoot = @shoot
    @creative_request.requested_by = @company.users.first
    @creative_request.company = @company
    @creative_request.accepted = false
    @creative_request.approved = nil
    @creative_request.declined = false

    assert_not @creative_request.save, "Saved the creative_request without a approved"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request Without a declined" do
    @creative_request = CreativeRequest.new
    @creative_request.creative = @creative
    @creative_request.shoot = @shoot
    @creative_request.requested_by = @company.users.first
    @creative_request.company = @company
    @creative_request.accepted = false
    @creative_request.approved = false
    @creative_request.declined = nil

    assert_not @creative_request.save, "Saved the creative_request without a declined"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request With all fields" do
    @creative_request = CreativeRequest.new
    @creative_request.creative = @creative
    @creative_request.shoot = @shoot
    @creative_request.requested_by = @company.users.first
    @creative_request.company = @company
    @creative_request.accepted = false
    @creative_request.approved = false
    @creative_request.declined = false

    assert @creative_request.save, "Saved the creative_request with all fields"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end


  test "CreativeRequest.create_for_shoot " do
    @creative_request = CreativeRequest.create_for_shoot(shoot_id: @shoot.id, creative_id: @creative.id)
    assert @creative_request
    assert @creative.notifications.count > 0

    assert @creative_request.destroy
    assert @shoot.destroy
    assert @project.destroy
    assert @location.destroy
    assert @company.destroy
    assert @creative.destroy
    assert @package_type.destroy
  end

  test "Accept Creative Request" do
    @creative_request = CreativeRequest.create_for_shoot(shoot_id: @shoot.id, creative_id: @creative.id)
    @creative_request.accept

    assert @creative_request.accepted
    assert @creative.notifications.count > 0
    assert @company.accepted_requests.count > 0

    assert @creative_request.destroy
    assert @shoot.destroy
    assert @project.destroy
    assert @location.destroy
    assert @company.destroy
    assert @creative.destroy
    assert @package_type.destroy
  end

  test "Decline Creative Request" do
    @creative_request = CreativeRequest.create_for_shoot(shoot_id: @shoot.id, creative_id: @creative.id)
    @creative_request.decline

    assert @creative_request.declined
    assert @creative.notifications.count > 0

    assert @creative_request.destroy
    assert @shoot.destroy
    assert @project.destroy
    assert @location.destroy
    assert @company.destroy
    assert @creative.destroy
    assert @package_type.destroy
  end
end
