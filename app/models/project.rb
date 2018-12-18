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


  #instance methods

  #tasks
  def all_tasks_complete
    self.tasks.where(completed: nil).count == 0
  end

  def try_complete
    if self.all_tasks_complete && self.balance_is_paid
      self.completed = true
      self.save
    end
  end

  def complete_project
    #TODO: Complete Project Mrthod
    p 'TODO: Complete Project Method'
    throw err;
  end

  ##Finance
  def udpdate_price
    #TODO - Update Price
    p 'TODO: Project Update Price Method'
    throw err;
  end

  def is_paid_in_full
    (self.deposit_is_paid && self.balance_is_paid) ? true : false
  end

  def deposit_payment
    self.payments.where(payment_type: 'deposit').first
  end

  def deposit_is_paid
    !self.payments.where(payment_type: 'deposit').first.nil?
  end

  def balance_payment
    self.payments.where(payment_type: 'balance').first
  end

  def balance_is_paid
    !self.payments.where(payment_type: 'deposit').first.nil?
  end

  def deposit_invoice
    self.invoices.where(invoice_type: 'deposit').first
  end

  def balance_invoice
    self.invoices.where(invoice_type: 'balance').first
  end
end
