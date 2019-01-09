require 'test_helper'

class ShotListItemTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')
  end

  test 'Create A Shot List Item With No Fields' do
    @shot_list_item = ShotListItem.new
    @shot_list_item.shoot = @shoot
    @shot_list_item.description = nil
    @shot_list_item.background = nil
    @shot_list_item.upload = nil
    @shot_list_item.item_type = nil
    @shot_list_item.focus_point = nil
    @shot_list_item.reference_image = nil
    @shot_list_item.aspect_ratio = nil
    @shot_list_item.added_by = nil

    assert_not @shot_list_item.save, 'Shot List Item saved with no fields populated'
    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test 'Create A Shot List Item With No Shoot' do
    @shot_list_item = ShotListItem.new
    @shot_list_item.shoot = nil
    @shot_list_item.description = nil
    @shot_list_item.background = nil
    @shot_list_item.upload = nil
    @shot_list_item.item_type = nil
    @shot_list_item.focus_point = nil
    @shot_list_item.reference_image = nil
    @shot_list_item.aspect_ratio = nil
    @shot_list_item.added_by = nil

    assert_not @shot_list_item.save, 'Shot List Item saved with no shoot populated'
    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end


  test 'Create A Shot List Item With No description and reference image' do
    @shot_list_item = ShotListItem.new
    @shot_list_item.shoot = @shoot
    @shot_list_item.description = nil
    @shot_list_item.background = "Background"
    @shot_list_item.upload = nil
    @shot_list_item.item_type = ContentType.photo
    @shot_list_item.focus_point = nil
    @shot_list_item.reference_image = nil
    @shot_list_item.aspect_ratio = 'portrait'
    @shot_list_item.added_by = @company.users.first

    assert_not @shot_list_item.save, 'Shot List Item saved without  description or reference fields populated'

    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test 'Create A Shot List Item With No added_by user ' do
    @shot_list_item = ShotListItem.new
    @shot_list_item.shoot = @shoot
    @shot_list_item.description = "Description"
    @shot_list_item.background = "Background"
    @shot_list_item.upload = nil
    @shot_list_item.item_type = ContentType.photo
    @shot_list_item.focus_point = nil
    @shot_list_item.reference_image = nil
    @shot_list_item.aspect_ratio = 'portrait'
    @shot_list_item.added_by = nil

    assert_not @shot_list_item.save, 'Shot List Item saved without recording who it was added by '

    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end


  test 'Create A Shot List Item With all required fields ' do
    @shot_list_item = ShotListItem.new
    @shot_list_item.shoot = @shoot
    @shot_list_item.description = "Description"
    @shot_list_item.background = "Background"
    @shot_list_item.upload = nil
    @shot_list_item.item_type = ContentType.photo
    @shot_list_item.focus_point = nil
    @shot_list_item.reference_image = nil
    @shot_list_item.aspect_ratio = 'portrait'
    @shot_list_item.added_by = @company.users.first

    assert @shot_list_item.save, 'Shot List Item  was not saved withall required fields '

    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end


  test 'Shot List Item realtionships are correct' do
    @shot_list_item = ShotListItem.new
    @shot_list_item.shoot = @shoot
    @shot_list_item.description = "Description"
    @shot_list_item.background = "Background"
    @shot_list_item.upload = nil
    @shot_list_item.item_type = ContentType.photo
    @shot_list_item.focus_point = nil
    @shot_list_item.reference_image = nil
    @shot_list_item.aspect_ratio = 'portrait'
    @shot_list_item.added_by = @company.users.first

    @shot_list_item.save

    assert_equal @shot_list_item.shoot.id, @shoot.id, "Shot List item shoot.shoot does not match @shoot"
    assert_equal @shot_list_item, @shoot.shot_list_items.where(id: @shot_list_item.id).first, "Shot List item shoot does not match"
    assert_equal @shot_list_item.added_by, @company.users.first, "Shot List item added_by does not match"

    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  #TODO: Write all tests for the Shot List Item Model
end
