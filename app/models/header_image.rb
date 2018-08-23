class HeaderImage < ApplicationRecord
  mount_uploader :file, ShotListUploader
end
