class ShowcaseVideo < ApplicationRecord
  mount_uploader :file, VideoUploader
  mount_uploader :thumbnail, LogoUploader

  validates :file, presence: true,  file_size: { less_than_or_equal_to: 50.megabytes }
  validates :thumbnail, presence: true, file_size: { less_than_or_equal_to: 20.megabytes }
end
