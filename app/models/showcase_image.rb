class ShowcaseImage < ApplicationRecord
  #validates :file, presence: true, file_size: { less_than_or_equal_to: 50.megabytes }
  mount_uploader :file, FileUploader
end
