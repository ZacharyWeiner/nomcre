class CollectionItem < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  mount_uploader :file, FileUploader
  mount_uploader :video, VideoUploader
  validates :file, file_size: { less_than_or_equal_to: 25.megabytes }
  validates :video, file_size: { less_than_or_equal_to: 25.megabytes }
end
