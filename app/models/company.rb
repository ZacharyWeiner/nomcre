class Company < ApplicationRecord
  before_destroy :deconstruct

  validates :name, presence: true, case_sensitive: false
  validates :phone, presence: true, case_sensitive: false
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

  #mount
  mount_uploader :logo, LogoUploader

  #collections
  def pending_requests
    CreativeRequest.where(company: self).where(accepted: nil).where(declined: nil)
  end
  def accepted_requests
    CreativeRequest.where(company: self).where(accepted: true)
  end

  def deconstruct
    self.invoices.each do |i|
      if !i.payment.nil?
        #TODO: Figure out what to do .. .maybe set up a dummy company? Maybe create a new dummy company?
        i.company = 1;
        i.save
      else
        i.destroy!
      end
    end
    self.users.each do |u|
      u.company = nil?
      u.save!
    end
  end


  #public methods
  def payments
    Payment.where(user: self.users)
  end

  def self.create_default_for_tests
    @user = User.first
    if @user.nil?
      @user = User.create!(name: 'Testy McTester', email: 'testy@mctester.com', password: 'password', password_confirmation: 'password')
    end
    @company = Company.create!(name: 'Test', logo: 'www.google.com', phone: '1800-888-9999', website: 'www.google.com', instagram: '@instagram')
    @company.users << @user
    @company.save!
    @company
  end
end
