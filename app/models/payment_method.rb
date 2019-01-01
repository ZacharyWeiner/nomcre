class PaymentMethod
  include ActiveModel::AttributeMethods

  def self.credit_card
    return 'cc'
  end

  def self.stripe
    return 'stripe'
  end

  def self.check
    return 'check'
  end

  def self.ach
    return 'ach'
  end

  def self.venmo
    return 'venmo'
  end

  def self.paypal
    return 'paypal'
  end
end
