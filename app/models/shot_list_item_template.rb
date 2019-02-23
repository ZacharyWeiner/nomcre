class ShotListItemTemplate < ApplicationRecord
  belongs_to :task_group
  mount_uploader :reference_image, ShotListUploader
end
