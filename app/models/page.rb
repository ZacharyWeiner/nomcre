class Page < ApplicationRecord
  mount_uploader :header_image, ShotListUploader
  has_many :page_sections
end
