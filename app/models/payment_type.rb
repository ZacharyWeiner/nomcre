class PaymentType
  include ActiveModel::AttributeMethods

  def self.balance
    return 'credit'
  end

  def self.deposit
  return 'debit'
  end
end

