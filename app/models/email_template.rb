class EmailTemplate < ApplicationRecord
  mount_uploader :example_image, LogoUploader
  has_many :emails
end
