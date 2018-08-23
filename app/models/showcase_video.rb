class ShowcaseVideo < ApplicationRecord
  mount_uploader :file, VideoUploader
  mount_uploader :thumbnail, LogoUploader
end
