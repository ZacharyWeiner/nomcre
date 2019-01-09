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
    assert false;
  end

  test "Company Has Accepted Requests" do
    assert false;
  end

  test "Company deconstructs properly" do
    assert false;
  end

end
