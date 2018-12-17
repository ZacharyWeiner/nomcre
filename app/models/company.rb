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

  #mount
  mount_uploader :logo, LogoUploader

  #public methods
  def payments
    Payment.where(user: self.users)
  end
end
