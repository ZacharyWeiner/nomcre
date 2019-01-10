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
    @project = Project.new(title: "Testy Tester", package_type_id: @pt.id, company_id: @company.id, brief: 'Testy Tester', deadline: Date.today, price: 100, max_user_shot_list: 100, is_template: false )
    assert @project.save, "Saved the project with all required fields"


    @project.destroy!
    @company.destroy!
    @pt.destroy!
  end

  #TODO: Write Tests for Each method of the model
  test "Project Has a Payment " do
    assert false;
  end

  test "Project is created with invoices" do
    assert false;
  end

  test "Project Has a shoots " do
    assert false;
  end

  test "Project Has Creatives " do

  end

  test "Project Has  Chatrooms " do
    assert false;
  end

  test "Project Has  Messages " do
    assert false;
  end

  test "Project Has Documents " do
    assert false;
  end

  test "Project Has assistants " do
    assert false;
  end

  test "Project Has Shot List items " do
    assert false;
  end

  test "Project has locations " do
    assert false;
  end

  test "Project Has a discount codes " do
    assert false;
  end

  test "Project::InstanceMethod -> Owners " do
    assert false;
  end

  test "Project::InstanceMethod -> Project Tasks " do
    assert false;
  end

  test "Project::InstanceMethod -> is editable " do
    assert false;
  end

  test "Project::InstanceMethod -> user_added_shot_list_items_max " do
    assert false;
  end

  test "Project::InstanceMethod -> user_added_shot_list_items_count " do
    assert false;
  end

  test "Project::InstanceMethod -> all_tasks_complete " do
    assert false;
  end

  test "Project::InstanceMethod -> try_complete " do
    assert false;
  end

  test "Project::InstanceMethod -> complete_project " do
    assert false;
  end

  test "Project::InstanceMethod -> update_price " do
    assert false;
  end

  test "Project::InstanceMethod -> is_paid_in_full " do
    assert false;
  end

  test "Project::InstanceMethod -> desposit_is_paid " do
    assert false;
  end

  test "Project::InstanceMethod -> balance_is_paid " do
    assert false;
  end

  test "Project::InstanceMethod -> deposit_paid_on " do
    assert false;
  end

  test "Project::InstanceMethod -> balance_paid_on " do
    assert false;
  end

  test "Project::InstanceMethod -> deposit_payment " do
    assert false;
  end

  test "Project::InstanceMethod -> deposit_invoice " do
    assert false;
  end

  test "Project::InstanceMethod -> balance_invoice " do
    assert false;
  end

  test "Project::InstanceMethod -> create from template " do
    assert false;
  end

  test "Project::InstanceMethod -> initalize_project " do
    assert false;
  end

  test "Project::InstanceMethod -> update_shoot_location " do
    assert false;
  end

  test "Project::InstanceMethod -> create_template_for_type " do
    assert false;
  end

  #TODO: Write Tests to Make Sure the callbacks work as expected


end
