class PackageType < ApplicationRecord
  belongs_to :header_image
  mount_uploader :description_image, PackageImageUploader
  mount_uploader :example_image, PackageImageUploader
  mount_uploader :example_video_thumbnail, PackageImageUploader
end
