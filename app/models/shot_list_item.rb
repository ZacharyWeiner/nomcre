class ShotListItem < ApplicationRecord
  belongs_to :proposal
  belongs_to :task, optional: true
  mount_uploader :upload, ShotListUploader
end
