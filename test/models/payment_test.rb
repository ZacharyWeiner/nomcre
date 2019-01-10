require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')
  end

  test "Create A Payment Without a User" do
    @payment = Payment.new
    @payment.user = nil
    @payment.project = @project
    @payment.payment_type = PaymentType.deposit
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 1000

    assert_not @payment.save, 'Payment saved without a user'
  end

  test "A Payment has a Company" do
    @payment = Payment.new
    @payment.user = @company.users.first
    @payment.project = @project
    @payment.payment_type = PaymentType.deposit
    @payment.payment_method = PaymentMethod.credit_card
    @payment.paid_on = Date.today
    @payment.amount = 1000

    assert @payment.save, 'Payment saved without a user'
    assert_equal @payment.company, @company, 'Payment company is not correct'
  end

  test "Create A Payment For a Invoice" do
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
    @invoice.reload()
    assert_equal @payment.invoices.first, @invoice, 'the invoice is expected to match that payment invoice'
  end

  test 'Payment::ClassMethod -> Create With notification' do
    @payment = Payment.create_with_notification({user_id: @company.users.first.id,
                                                 project_id: @project.id,
                                                 payment_type: PaymentType.deposit,
                                                 payment_method: PaymentMethod.credit_card,
                                                 paid_on: Date.today,
                                                 amount: 1000})
    @notification = Notification.where(user_id: @company.users.first, notification_type: NotificationType.payment_made, notification_object_id: @payment.id)
    assert_not @notification.nil?
  end
end
