class Project < ApplicationRecord
  #belongs_to
  belongs_to :package_type
  belongs_to :company

  #has_one

  #has_many
  has_many :payments
  has_many :invoices
  has_many :shoots
  has_many :creatives, through: :shoots
  has_many :chatrooms, through: :shoots
  has_many :messages, through: :chatrooms
  has_many :documents, through: :shoots
  has_many :assistants, through: :shoots
  has_many :shot_list_items, through: :shoots
  has_and_belongs_to_many :discount_codes

  #scopes
  def owners
    self.company.users
  end

  def tasks
    shoot_ids = self.shoots.map{|s| s.id}
    Task.where(shoot_id: shoot_ids).or(Task.where(project_id: self.id))
  end

  def deposit_payment
    self.payments.where(payment_type: 'deposit').first
  end

  def deposit_paid
    !self.payments.where(payment_type: 'deposit').first.nil?
  end

  def balance_payment
    self.payments.where(payment_type: 'balance').first
  end

  def balance_paid
    !self.payments.where(payment_type: 'deposit').first.nil?
  end
end
