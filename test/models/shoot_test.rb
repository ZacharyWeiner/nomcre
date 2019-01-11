require 'test_helper'

class ShootTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')
  end
  #TODO: Write Tests for Shoots Fields & Relationships
  test 'Creating a Shoot without a project' do
    @shoot = Shoot.new
    @shoot.project = nil
    @shoot.company = @company
    @shoot.location = @location
    @shoot.content_type = ContentType.photo
    @shoot.brief = 'This is some brief text'
    @shoot.price = @package_type.base_price * 0.65
    @shoot.background = 'Historic Building'
    @shoot.shoot_style = ShootStyle.lifestyle
    @shoot.user_added_shot_count_max = @project.max_user_shot_list
    @shoot.user_saved = false
    @shoot.deadline = Date.today + 60.days

    assert_not @shoot.save, 'Saved shoot without a project'

    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end

  test 'Creating a Shoot without a company' do
    @shoot = Shoot.new
    @shoot.project = @project
    @shoot.company = nil
    @shoot.location = @location
    @shoot.content_type = ContentType.photo
    @shoot.brief = 'This is some brief text'
    @shoot.price = @package_type.base_price * 0.65
    @shoot.background = 'Historic Building'
    @shoot.shoot_style = ShootStyle.lifestyle
    @shoot.user_added_shot_count_max = @project.max_user_shot_list
    @shoot.user_saved = false
    @shoot.deadline = Date.today + 60.days

    assert_not @shoot.save, 'Saved shoot without a company'

    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end

  test 'Creating a Shoot without a location' do
    @shoot = Shoot.new
    @shoot.project = @project
    @shoot.company = @company
    @shoot.location = nil
    @shoot.content_type = ContentType.photo
    @shoot.brief = 'This is some brief text'
    @shoot.price = @package_type.base_price * 0.65
    @shoot.background = 'Historic Building'
    @shoot.shoot_style = ShootStyle.lifestyle
    @shoot.user_added_shot_count_max = @project.max_user_shot_list
    @shoot.user_saved = false
    @shoot.deadline = Date.today + 60.days

    assert_not @shoot.save, 'Saved shoot without a location'

    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end

  test 'Creating a Shoot without a price' do
    @shoot = Shoot.new
    @shoot.project = @project
    @shoot.company = @company
    @shoot.location = @location
    @shoot.content_type = ContentType.photo
    @shoot.brief = 'This is some brief text'
    @shoot.price = nil
    @shoot.background = 'Historic Building'
    @shoot.shoot_style = ShootStyle.lifestyle
    @shoot.user_added_shot_count_max = @project.max_user_shot_list
    @shoot.user_saved = false
    @shoot.deadline = Date.today + 60.days

    assert_not @shoot.save, 'Saved shoot without a price'

    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end

  test 'Creating a Shoot without a max shot list count' do
    @shoot = Shoot.new
    @shoot.project = @project
    @shoot.company = @company
    @shoot.location = @location
    @shoot.content_type = ContentType.photo
    @shoot.brief = 'This is some brief text'
    @shoot.price = @package_type.base_price * 0.65
    @shoot.background = 'Historic Building'
    @shoot.shoot_style = ShootStyle.lifestyle
    @shoot.user_added_shot_count_max = nil
    @shoot.user_saved = false
    @shoot.deadline = Date.today + 60.days

    assert_not @shoot.save, 'Saved shoot without a max shot list count'

    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end

  test 'Creating a Shoot without a deadline' do
    @shoot = Shoot.new
    @shoot.project = @project
    @shoot.company = @company
    @shoot.location = @location
    @shoot.content_type = ContentType.photo
    @shoot.brief = 'This is some brief text'
    @shoot.price = @package_type.base_price * 0.65
    @shoot.background = 'Historic Building'
    @shoot.shoot_style = ShootStyle.lifestyle
    @shoot.user_added_shot_count_max = @project.max_user_shot_list
    @shoot.user_saved = false
    @shoot.deadline = nil

    assert_not @shoot.save, 'Saved shoot without a deadline'

    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end

  test 'Creating a Shoot with a deadline too close to today' do
    @shoot = Shoot.new
    @shoot.project = @project
    @shoot.company = @company
    @shoot.location = @location
    @shoot.content_type = ContentType.photo
    @shoot.brief = 'This is some brief text'
    @shoot.price = @package_type.base_price * 0.65
    @shoot.background = 'Historic Building'
    @shoot.shoot_style = ShootStyle.lifestyle
    @shoot.user_added_shot_count_max = @project.max_user_shot_list
    @shoot.user_saved = false
    @shoot.deadline = Date.today + 2.days

    assert_not @shoot.save, 'Saved shoot with a deadline too close to today'

    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end

  test 'Creating a Shoot with all required fields' do
    @shoot = Shoot.new
    @shoot.project = @project
    @shoot.company = @company
    @shoot.location = @location
    @shoot.content_type = ContentType.photo
    @shoot.brief = 'This is some brief text'
    @shoot.price = @package_type.base_price * 0.65
    @shoot.background = 'Historic Building'
    @shoot.shoot_style = ShootStyle.lifestyle
    @shoot.user_added_shot_count_max = @project.max_user_shot_list
    @shoot.user_saved = false
    @shoot.deadline = Date.today + 60.days

    assert @shoot.save, 'Could not save shoot with all required fields'

    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end

  test 'Creating a Shoot and testing its relationships' do

    @shoot = Shoot.new(
    project: @project,
    company: @company,
    location: @location,
    content_type: ContentType.photo,
    brief: 'This is some brief text',
    price: @package_type.base_price * 0.65,
    background: 'Historic Building',
    shoot_style: ShootStyle.lifestyle,
    user_added_shot_count_max: @project.max_user_shot_list,
    user_saved: false,
    deadline: Date.today + 60.days)

    @shoot.save




    assert_equal @shoot.project, @project, 'Shoot.project != @project'
    #TODO: Figure out why the reverse reationship fails for project
    #assert_equal @shoot, @project.shoots.first, 'Shoot != @project.shoots.first'
    assert_equal @shoot.company, @company, 'shoot.company != company'
    assert_equal @shoot, @company.shoots.first, 'shoot != company.shoots.first'
    assert_equal @shoot.location, @location, 'shoot.location != location'
    assert_equal @shoot, @location.shoots.first, 'shoot.location != location'
    assert_equal @shoot.user_added_shot_count_max, @project.max_user_shot_list, 'shoot.max_user_shot_list != project.max_user_shot_list'


    @shoot.destroy!
    @project.destroy!
    @location.destroy!
    @creative.destroy!
    @company.users.first.destroy!
    @creative.destroy!
  end


  #TODO: Write Tests that prove the callbacks work correctly
  test "Shoot::Instance Method -> is editable - yes" do
    assert false
  end

  test "Shoot::Instance Method -> is editable - no" do
    assert false
  end

  test "Shoot::Instance Method -> all tasks complete - yes" do
    assert false
  end

  test "Shoot::Instance Method -> pending requests" do
    assert false
  end

  test "Shoot::Instance Method -> accepted_requests" do
    assert false
  end

  test "Shoot::Instance Method -> find_creatives" do
    assert false
  end

  test "Shoot::Instance Method -> assign_from_request" do
    assert false
  end

  test "Shoot::Instance Method -> assign_chatroom" do
    assert false
  end

  test "Shoot::Instance Method -> can_assign_creative" do
    assert false
  end

  test "Shoot::Instance Method -> has_request_for_creative" do
    assert false
  end

  test "Shoot::Instance Method -> request_for_creative" do
    assert false
  end

  test "Shoot::Instance Method -> creative_accepted_request" do
    assert false
  end

  test "Shoot::Instance Method -> owner_added_shot_list_count" do
    assert false
  end

  test "Shoot::Instance Method -> owner_added_shot_list" do
    assert false
  end

  test "Shoot::Instance Method -> set_default_shot_list" do
    assert false
  end

  test "Shoot::Instance Method -> create_shoots_from_template" do
    assert false
  end
  #TODO: Write Tests For Each Method on the Model
end
