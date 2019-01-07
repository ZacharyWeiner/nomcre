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
    @pt.destroy!
    @company.destroy!
    @project.destroy!
  end


end
