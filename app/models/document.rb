class Document < ApplicationRecord
  belongs_to :proposal, optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :assistant, optional: true

  mount_uploader :file, DisclosureUploader
  mount_uploader :media, VideoUploader
end
