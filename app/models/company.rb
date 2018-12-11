class Company < ApplicationRecord
  has_many :users
  has_many :tasks
  has_many :proposals
  has_many :documents
  mount_uploader :logo, LogoUploader
end
