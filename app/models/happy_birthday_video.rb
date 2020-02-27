class HappyBirthdayVideo < ApplicationRecord
  mount_uploader :file, VideoUploader
  mount_uploader :cover, ShotListUploader
end
