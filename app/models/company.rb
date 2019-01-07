class Company < ApplicationRecord
  #belongs_to

  #has_one

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


  #public methods
  def payments
    Payment.where(user: self.users)
  end

  def self.create_default_for_tests
    Company.create!(name: 'Test', logo: 'www.google.com', phone: '1800-888-9999', website: 'www.google.com', instagram: '@instagram')
  end
end
