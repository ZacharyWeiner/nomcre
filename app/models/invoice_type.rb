class InvoiceType
  include ActiveModel::AttributeMethods

  def self.balance
    return 'balance'
  end

  def self.deposit
    return 'deposit'
  end
end
