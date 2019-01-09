require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')
  end

  test "Create A Creative Request Without a Project" do

    @invoice = Invoice.new
    @invoice.project = nil
    @invoice.company = @company
    @invoice.payment = nil
    assert_not @invoice.save, "Saved the invoice without a project"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request Without a Company" do

    @invoice = Invoice.new
    @invoice.project = @project
    @invoice.company = nil
    @invoice.payment = nil
    assert_not @invoice.save, "Saved the invoice without a project"


    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Create A Creative Request Without a Payment" do

    @invoice = Invoice.new
    @invoice.project = @project
    @invoice.company = @company
    @invoice.payment = nil
    assert @invoice.save, "Saving the invoice without a payment failed"

    @invoice.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

  test "Invoice has a related required fields" do
    @payment = Payment.create!(user: @company.users.first,
                              project: @project,
                              payment_type: PaymentType.deposit,
                              payment_method: PaymentMethod.credit_card,
                              paid_on: Date.today,
                              amount: @project.deposit_invoice.amount)
    @invoice = Invoice.new
    @invoice.project = @project
    @invoice.company = @company
    @invoice.payment = @payment
    @invoice.save!
    assert_equal(@invoice.project, @project, "project is not equal to belongs_to")
    assert_equal(@invoice.company, @company, "project is not equal to belongs_to")
    assert_equal(@invoice.payment, @payment, "project is not equal to belongs_to")


    @invoice.destroy!
    @payment.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.users.first.destroy!
    @company.destroy!
    @package_type.destroy!
    @location.destroy!
  end

end
