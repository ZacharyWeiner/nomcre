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




    assert @shoot.is_editable, 'Shoot should be editable'
  end

  test "Shoot::Instance Method -> is editable - no" do
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


    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.deposit
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 5000
    @payment.save
    @invoice = @project.invoices.first
    @invoice.payment = @payment
    @invoice.save!

    @creative = User.create!(name: 'Accepter', email: 'accepter@accepter.com', password: 'password', password_confirmation: 'password')
    @shoot.creative = @creative
    @shoot.save!
    @shoot.reload

    assert_not @shoot.is_editable, 'shoot should not be editable'
  end

  test "Shoot::Instance Method -> all tasks complete - yes" do
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

    @shoot.create_default_shot_list_for_photo

    @shoot.tasks.each do |t|
      t.completed = true
      t.save!
    end
    assert @shoot.all_tasks_complete, 'all tasks should not be completed yet'
  end

  test "Shoot::Instance Method -> all tasks complete - no" do
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

    @shoot.create_default_shot_list_for_photo
    assert_not @shoot.all_tasks_complete, 'all tasks should not be completed yet'

  end

  test "Shoot::Instance Method -> pending requests" do
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

    @creative_request = CreativeRequest.create!(shoot_id: @shoot.id, requested_by_id: @company.users.first.id, creative_id: @creative.id, company_id: @company.id, accepted: false, deadline: Date.today + 30.days, approved: false, declined: false)

    @shoot.reload
    assert_equal 1, @shoot.pending_requests.count, 'there should be 1 pending request'

  end

  test "Shoot::Instance Method -> accepted_requests" do
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

    @creative_request = CreativeRequest.create!(shoot_id: @shoot.id, requested_by_id: @company.users.first.id, creative_id: @creative.id, company_id: @company.id, accepted: true, deadline: Date.today + 30.days, approved: false, declined: false)

    @shoot.reload
    assert_equal 1, @shoot.accepted_requests.count, 'there should be 1 accepted request'
  end

  test "Shoot::Instance Method -> find_creatives" do
    assert false, 'Not Implemented Yet'
  end

  test "Shoot::Instance Method -> assign_from_request" do
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

    @creative_request = CreativeRequest.create!(shoot_id: @shoot.id, requested_by_id: @company.users.first.id, creative_id: @creative.id, company_id: @company.id, accepted: true, deadline: Date.today + 30.days, approved: false, declined: false)

    @shoot.assign_from_request @creative_request.id
    @shoot.reload

    assert_equal @creative, @shoot.creative, 'the shoot should have assigned the creative'
  end

  test "Shoot::Instance Method -> assign_chatroom" do
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

    @creative_request = CreativeRequest.create!(shoot_id: @shoot.id, requested_by_id: @company.users.first.id, creative_id: @creative.id, company_id: @company.id, accepted: true, deadline: Date.today + 30.days, approved: true, declined: false)

    @shoot.assign_chatroom @creative
    @shoot.reload

    assert_not @shoot.chatroom.nil?, 'Chatroom should not be nil'
  end

  test "Shoot::Instance Method -> can_assign_creative -false " do
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

    assert_not @shoot.can_assign_creative, 'the shoot should not be able to assign a creative'
  end

  test "Shoot::Instance Method -> can_assign_creative -true " do
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

    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.deposit
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 1000
    @payment.save
    @invoice = @project.invoices.first
    @invoice.payment = @payment
    @invoice.save!

    assert @shoot.can_assign_creative, 'the shoot should not be able to assign a creative'
  end

  test "Shoot::Instance Method -> has_request_for_creative" do
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

    @creative_request = CreativeRequest.create!(shoot_id: @shoot.id, requested_by_id: @company.users.first.id, creative_id: @creative.id, company_id: @company.id, accepted: true, deadline: Date.today + 30.days, approved: true, declined: false)

    assert @shoot.has_request_for_creative(@creative.id), 'shoot should have a request for the creative'
  end

  test "Shoot::Instance Method -> request_for_creative" do
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

    @creative_request = CreativeRequest.create!(shoot_id: @shoot.id, requested_by_id: @company.users.first.id, creative_id: @creative.id, company_id: @company.id, accepted: true, deadline: Date.today + 30.days, approved: true, declined: false)

    assert_equal @creative_request, @shoot.request_for_creative(@creative), 'request.creative and creative should match'
  end

  test "Shoot::Instance Method -> creative_accepted_request" do
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

    @creative_request = CreativeRequest.create!(shoot_id: @shoot.id, requested_by_id: @company.users.first.id, creative_id: @creative.id, company_id: @company.id, accepted: true, deadline: Date.today + 30.days, approved: true, declined: false)

    assert @shoot.creative_accepted_request(@creative.id), 'creative should have accepted the request'
  end

  test "Shoot::Instance Method -> creative_accepted_request - falses" do
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



    assert_not @shoot.creative_accepted_request(@creative.id), 'creative did not accepted the request'
  end

  test "Shoot::Instance Method -> owner_added_shot_list_count" do

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

    @shot_list_item = ShotListItem.create!(description: 'somethign sweet', shoot_id: @shoot.id, added_by_id: @company.users.first.id )


    assert_equal 1, @shoot.owner_added_shot_list_count, 'shoot.owner_added_shot_list_count should be greater than 0 '

  end

  test "Shoot::Instance Method -> owner_added_shot_list" do
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

    @shot_list_item = ShotListItem.create!(description: 'somethign sweet', shoot_id: @shoot.id, added_by_id: @company.users.first.id )


    assert @shoot.owner_added_shot_list.count > 0,  'shoot.owner_added_shot_list should be greater than 0 '

  end

  test "Shoot::Instance Method -> set_default_shot_list - photo" do
     @shoot = Shoot.new(
    project: @project,
    company: @company,
    location: @location,
    content_type: ContentType.photo,
    brief: 'This is some brief text',
    price: @package_type.base_price * 0.35,
    background: 'Historic Building',
    shoot_style: ShootStyle.lifestyle,
    user_added_shot_count_max: @project.max_user_shot_list,
    user_saved: false,
    deadline: Date.today + 60.days)
    @shoot.save

    @shoot.reload
    assert @shoot.shot_list_items.count == 38, "the default shot list should be 38 but is #{@shoot.shot_list_items.count}"
    @shoot.destroy!
  end

  test "Shoot::Instance Method -> set_default_shot_list - video" do
     @shoot = Shoot.new(
    project: @project,
    company: @company,
    location: @location,
    content_type: ContentType.video,
    brief: 'This is some brief text',
    price: @package_type.base_price * 0.65,
    background: 'Historic Building',
    shoot_style: ShootStyle.lifestyle,
    user_added_shot_count_max: @project.max_user_shot_list,
    user_saved: false,
    deadline: Date.today + 60.days)
    @shoot.save

    @shoot.reload
    assert @shoot.shot_list_items.count == 31, "the default shot list should 31 but is #{@shoot.shot_list_items.count}"
    @shoot.destroy
  end

  test "Shoot::Instance Method -> create_shoots_from_template" do
    Shoot.create_shoots_from_template(@package_type.id, @project.id)
    assert @project.shoots.count ==2, 'create shoots from template should work properly '
  end
  #TODO: Write Tests For Each Method on the Model
end
