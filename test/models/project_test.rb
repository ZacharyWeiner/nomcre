require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @pt = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
  end

  test "Create A Project Without a Title" do
    @project = Project.new(title: nil,
                          package_type_id: @pt.id,
                          company_id: @company.id,
                          brief: 'Testy Tester',
                          deadline: Date.today,
                          price: 100,
                          max_user_shot_list: 100,
                          is_template: false )

    assert_not @project.save, "Saved the project without a title"
    @pt.destroy!
    @company.destroy!
    @project.destroy!
  end

  test "Create A Project Without a PackageType" do
    @project = Project.new(title: "Testy Tester",
                          package_type_id: nil,
                          company_id: @company.id,
                          brief: 'Testy Tester',
                          deadline: Date.today,
                          price: 100,
                          max_user_shot_list: 100,
                          is_template: false )
    assert_not @project.save, "Saved the project without a package type"
    @pt.destroy!
    @company.destroy!
    @project.destroy!
  end

  test "Create A Project Without a Company" do
    @project = Project.new(title: "Testy Tester",
                          package_type_id: @pt.id,
                          company_id: nil,
                          brief: 'Testy Tester',
                          deadline: Date.today,
                          price: 100,
                          max_user_shot_list: 100,
                          is_template: false )
    assert_not @project.save, "Saved the project without a company"
    @pt.destroy!
    @company.destroy!
    @project.destroy!
  end

  test "Create A Project Without a brief" do
    @project = Project.new(title: "Testy Tester",
                          package_type_id: @pt.id,
                          company_id: @company.id,
                          brief: nil,
                          deadline: Date.today,
                          price: 100,
                          max_user_shot_list: 100,
                          is_template: false )
    assert_not @project.save, "Saved the project without a brief"
    @pt.destroy!
    @company.destroy!
    @project.destroy!
  end

  test "Create A Project Without a deadline" do
    @project = Project.new(title: "Testy Tester",
                          package_type_id: @pt.id,
                          company_id: @company.id,
                          brief: 'Testy Tester',
                          deadline: nil,
                          price: 100,
                          max_user_shot_list: 100,
                          is_template: false )
    assert_not @project.save, "Saved the project without a deadline"
    @pt.destroy!
    @company.destroy!
    @project.destroy!
  end

  test "Create A Project Without a price" do
    @project = Project.new(title: "Testy Tester",
                          package_type_id: @pt.id,
                          company_id: @company.id,
                          brief: 'Testy Tester',
                          deadline: Date.today,
                          price: nil,
                          max_user_shot_list: 100,
                          is_template: false )
    assert_not @project.save, "Saved the project without a price"
    @pt.destroy!
    @company.destroy!
    @project.destroy!
  end

  test "Create A Project Without a max_user_shot_list" do
    @project = Project.new(title: "Testy Tester",
                          package_type_id: @pt.id,
                          company_id: @company.id,
                          brief: 'Testy Tester',
                          deadline: Date.today,
                          price: 1000,
                          max_user_shot_list: nil,
                          is_template: false )
    assert_not @project.save, "Saved the project without a max_user_shot_list"
    @pt.destroy!
    @company.destroy!
    @project.destroy!
  end

  test "Create A Project With all required fields " do
    @project = Project.new(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    assert @project.save, "Saved the project with all required fields"


    @project.destroy!
    @company.destroy!
    @pt.destroy!
  end

  #TODO: Write Tests for Each method of the model
  test "Project Has a Payment " do
     @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
     @payment = Payment.create!(user: @project.company.users.first,
                                project: @project,
                                paid_on: Date.today)

     assert_equal @payment, @project.payments.first, 'the project should have a payment'
  end

  test "Project is created with invoices" do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    assert_equal 2, @project.invoices.count, 'the project should be created with 2 invloices'
  end

  test "Project Has a shoots " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)

    assert_equal 2, @project.shoots.count, 'project should have 2 shoots'
  end

  test "Project Has Creatives " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)
    @creative1 = User.create!(name: 'Creative One', email: 'creative1@creative.com', password: 'password', password_confirmation: 'password')
    @creative2 = User.create!(name: 'Creative Two', email: 'creative2@creative.com', password: 'password', password_confirmation: 'password')
    @shoot1.creative = @creative1
    @shoot1.save!
    @shoot2.creative = @creative2
    @shoot2.save

    assert_equal 2, @project.creatives.count, 'Project does not have 2 creatives'
  end

  test "Project Has  Chatrooms " do
     @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)
    @chatroom1 = Chatroom.create_for_shoot(topic: "Shoot 1", shoot_id: @shoot1.id)
    @chatroom2 = Chatroom.create_for_shoot(topic: "Shoot 12", shoot_id: @shoot2.id)

    assert_equal 2, @project.chatrooms.count, 'Project does not have 2 chatrooms'
  end

  test "Project Has  Messages " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)
    @chatroom1 = Chatroom.create_for_shoot(topic: "Shoot 1", shoot_id: @shoot1.id)
    @chatroom2 = Chatroom.create_for_shoot(topic: "Shoot 12", shoot_id: @shoot2.id)
    @message1 = Message.create(user_id: @company.users.first.id, chatroom_id: @chatroom1.id, content: 'Message me')
    @message2 = Message.create(user_id: @company.users.first.id, chatroom_id: @chatroom1.id, content: 'Message back')
    assert_equal 2, @project.messages.count, 'Project does not have 2 messages'
  end

  test "Project Has Documents " do
    assert false, 'Not Implemented';
  end

  test "Project Has assistants " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @assitant = Assistant.create_for_shoot(shoot_id: @shoot1.id, name: 'Assistant 1', phone: '9995556666', paypal_email: 'email@email.com',
                                            rate: 60, assistant_type: AssistantType.hmu, location_id: Location.first.id)
    @assitant2 = Assistant.create_for_shoot(shoot_id: @shoot1.id, name: 'Assistant 2', phone: '9995556667', paypal_email: 'email1@email.com',
                                            rate: 60, assistant_type: AssistantType.hmu, location_id: Location.first.id)

    assert_equal 2, @project.assistants.count, 'The project does not have 2 assistants'

  end

  test "Project Has Shot List items " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot1.create_default_shot_list_for_photo

    assert_not @project.shot_list_items.count == 0, 'there should be more than 0 shot list items for a project'
  end

  test "Project has locations " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    assert_equal 2, @project.locations.count, 'the prjoject should have two locations but does not'
  end

  test "Project Has a discount codes " do
    assert false, 'Not Implemented';
  end

  test "Project::InstanceMethod -> Owners " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)

    assert_not @project.owners.nil?, 'the project should have owners'
  end

  test "Project::InstanceMethod -> Project Tasks " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot1.create_default_shot_list_for_photo

    assert_not @project.project_tasks.count == 0, 'the project should have tasks'
  end

  test "Project::InstanceMethod -> is editable - before payment  " do
     @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
     assert @project.is_editable(@company.users.first), 'project should be editable'
  end

  test "Project::InstanceMethod -> is editable - after payment  " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)


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

    assert_not @project.is_editable(@company.users.first), 'project should not be editable'
  end

  test "Project::InstanceMethod -> user_added_shot_list_items_max " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot1.user_added_shot_count_max = 25
    @shoot1.save!

    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)
    @shoot2.user_added_shot_count_max = 25
    @shoot2.save!
    @project.reload()
    assert @project.user_added_shot_list_items_max > 0, 'max should be greater than 0'
  end

  test "Project::InstanceMethod -> user_added_shot_list_items_count " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)
    @project.reload
    @shot_list_item = ShotListItem.create!(shoot_id: @shoot1.id, description: 'something cool', added_by_id: @company.users.first.id)
    @shot_list_item2 = ShotListItem.create!(shoot_id: @shoot2.id, description: 'something cool', added_by_id: @company.users.first.id)
    assert @project.user_added_shot_list_items_count > 0, 'max should be greater than 0'
  end

  test "Project::InstanceMethod -> all_tasks_complete - false " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @shoot1.create_default_shot_list_for_photo
    @shoot2.create_default_shot_list_for_video

    assert @project.project_tasks.count > 0, 'project should have tasks'
    assert_not @project.all_tasks_complete, 'all tasks complete should be false'
  end

  test "Project::InstanceMethod -> all_tasks_complete - true " do
     @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @shoot1.create_default_shot_list_for_photo
    @shoot2.create_default_shot_list_for_video

    assert @project.project_tasks.count > 0, 'project should have tasks'

    @project.project_tasks.each do |pt|
      pt.completed = true
      pt.save!
    end
    assert @project.all_tasks_complete, 'all tasks complete should be false'
  end

  test "Project::InstanceMethod -> try_complete - false" do
     @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @shoot1.create_default_shot_list_for_photo
    @shoot2.create_default_shot_list_for_video

    assert @project.project_tasks.count > 0, 'project should have tasks'
    assert_not @project.try_complete, 'try complete should be false'
  end

  test "Project::InstanceMethod -> try_complete - true" do
     @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @shoot1.create_default_shot_list_for_photo
    @shoot2.create_default_shot_list_for_video

    assert @project.project_tasks.count > 0, 'project should have tasks'

    @project.project_tasks.each do |pt|
      pt.completed = true
      pt.save!
    end
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

    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.balance
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 1000
    @payment.save
    @invoice = @project.invoices.last
    @invoice.payment = @payment
    @invoice.save!

    @project.reload

    assert @project.try_complete, 'try complete should be true'
  end

  test "Project::InstanceMethod -> complete_project " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @shoot1.create_default_shot_list_for_photo
    @shoot2.create_default_shot_list_for_video

    assert @project.project_tasks.count > 0, 'project should have tasks'

    @project.project_tasks.each do |pt|
      pt.completed = true
      pt.save!
    end
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

    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.balance
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 1000
    @payment.save
    @invoice = @project.invoices.last
    @invoice.payment = @payment
    @invoice.save!

    @project.reload

    assert @project.try_complete, 'try complete should be true'
    @project.complete_project
    assert @project.is_complete, 'project should be complete'
  end

  test "Project::InstanceMethod -> update_price " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!

    @project.reload

    assert @project.price == 10000, 'price should be 10K'
    assert @project.deposit_invoice.amount == 5000, 'deposit invoice should be half'
    assert @project.balance_invoice.amount == 5000, 'balance invoice should be half'
  end

  test "Project::InstanceMethod -> is_paid_in_full - false  " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    assert_not @project.is_paid_in_full, 'project should not be paid in full'
  end

  test "Project::InstanceMethod -> is_paid_in_full - true  " do
   @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!



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

    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.balance
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 5000
    @payment.save
    @invoice = @project.invoices.last
    @invoice.payment = @payment
    @invoice.save!

    @project.reload
    assert @project.is_paid_in_full, 'project should be paid in full'

  end

  test "Project::InstanceMethod -> desposit_is_paid " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!
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
    @project.reload

    assert @project.deposit_is_paid
  end

  test "Project::InstanceMethod -> balance_is_paid " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!



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

    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.balance
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 5000
    @payment.save
    @invoice = @project.invoices.last
    @invoice.payment = @payment
    @invoice.save!

    @project.reload
    assert @project.balance_is_paid, 'project should be paid in full'
  end

  test "Project::InstanceMethod -> deposit_paid_on " do
   @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!



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

    @project.reload
    assert_equal Date.today, @project.deposit_paid_on, 'the deposit shoul dhave been paid today'
  end

  test "Project::InstanceMethod -> balance_paid_on " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!



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

    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.balance
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 5000
    @payment.save
    @invoice = @project.invoices.last
    @invoice.payment = @payment
    @invoice.save!

    @project.reload

    assert_equal Date.today, @project.balance_paid_on, 'balance should have a date that matches'
  end

  test "Project::InstanceMethod -> deposit_payment " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!



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

    @project.reload
    assert_equal @payment, @project.deposit_payment, 'payment should match the related payment'
  end

  test "Project::InstanceMethod -> deposit_invoice " do
     @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!

    assert_equal Invoice.first, @project.deposit_invoice, 'deposit invoice should be the first'
  end

  test "Project::InstanceMethod -> balance_invoice " do
    @project = Project.create!(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today + 60.days, price: 100, max_user_shot_list: 100, is_template: false )
    @location = Location.create_default_for_tests
    @shoot1 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.first.id)
    @shoot2 = Shoot.create_default_for_tests(@project.id, @company.id, Location.all.last.id)

    @project.update_price 10000
    @project.save!

    assert_equal Invoice.last, @project.balance_invoice, 'balance invoice should be the first'
  end

  test "Project::InstanceMethod -> create from template " do
    assert false, 'Not Implemented';
  end

  test "Project::InstanceMethod -> initalize_project " do
    assert false, 'Not Implemented';
  end

  test "Project::InstanceMethod -> update_shoot_location " do
    assert false, 'Not Implemented';
  end

  test "Project::InstanceMethod -> create_template_for_type " do
    assert false, 'Not Implemented';
  end

  #TODO: Write Tests to Make Sure the callbacks work as expected


end
