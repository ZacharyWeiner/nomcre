class Company < ApplicationRecord
  #callbacks
  before_destroy :deconstruct

  #validations
  validates :name,    presence: true, case_sensitive: false
  validates :phone,   presence: true, case_sensitive: false
  validates :website, presence: true, case_sensitive: false

  #has_many
  has_many :users
  has_many :tasks
  has_many :proposals
  has_many :documents
  has_many :projects
  has_many :shoots
  has_many :invoices
  has_many :creative_requests
  has_many :chatrooms, through: :users
  has_many :payments

  #mount
  mount_uploader :logo, LogoUploader

  #collections
  def pending_requests
    CreativeRequest.where(company: self).where(accepted: false).where(declined: false)
  end

  def accepted_requests
    CreativeRequest.where(company: self).where(accepted: true)
  end

  def payments
    Payment.where(user: self.users)
  end

  #public methods
  def self.create_default_for_tests
    @user = nil
    @user = User.create!(name: 'Testy McTester',
                        email: 'testy@mctester.com',
                        password: 'password',
                        password_confirmation: 'password') if @user.nil?

    @company = Company.create!(name: 'Test',
                               logo: 'www.google.com',
                               phone: '1800-888-9999',
                               website: 'www.google.com',
                               instagram: '@instagram')
    @company.users << @user
    @company.save!
    @company
  end

  #deconstructor
  def deconstruct
    deconstruct_invoices
    deconstruct_users
  end

  def deconstruct_invoices
    self.invoices.each do |i|
      if !i.payment.nil?
        #TODO: Figure out what to do .. .maybe set up a dummy company? Maybe create a new dummy company?
        i.company = 1;
        i.save
      else
        i.destroy!
      end
    end
  end

  def deconstruct_users
    self.users.each do |u|
      u.company = nil?
      u.save!
    end
  end
end
