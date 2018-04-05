require 'file_size_validator'
class CollectionItem < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  mount_uploader :file, FileUploader
  mount_uploader :video, VideoUploader
  validates :file, file_size: { less_than_or_equal_to: 25.megabytes }
  validates :video, file_size: { less_than_or_equal_to: 25.megabytes }
  #validates :file_size



  # def file_size
  #   byebug
  #   if file.file.size.to_f/(1000*1000) > 10485760.to_f
  #     errors.add(:file, "You cannot upload a file greater than 10 MB")
  #   end
  # end
end
