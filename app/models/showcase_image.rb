class ShowcaseImage < ApplicationRecord
  mount_uploader :file, FileUploader
end
