class Payment < ApplicationRecord
  #belongs_to ->
  belongs_to :user
  belongs_to :project, optional: true

  #has_one ->
  has_one :company, through: :user

  #has_many ->
  has_many :invoices

  def self.create_with_notification(options = {})
    @payment = Payment.new
    @payment.user_id = options[:user_id]
    @payment.project_id = options[:project_id] ? options[:project_id] : nil
    @payment.payment_type = options[:payment_type] ? options[:payment_type] : nil
    @payment.category = options[:category] ? options[:category] : nil
    @payment.payment_method = options[:payment_method] ? options[:payment_method] : nil
    @payment.external_id = options[:external_id] ? options[:external_id] : nil
    @payment.paid_on = options[:paid_on] ? options[:paid_on] : Date.today

    if @payment.save
      Notification.create!(user_id: options[:user_id], notification_type: NotificationType.payment_made, notification_object_id: @payment.id, read: false)
    end
    @payment
  end
end

