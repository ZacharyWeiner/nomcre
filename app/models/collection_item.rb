class CollectionItem < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  mount_uploader :file, FileUploader
  mount_uploader :video, VideoUploader
end
