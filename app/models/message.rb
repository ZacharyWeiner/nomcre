class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true, case_sensitive: false

  mount_uploader :file, LogoUploader
  after_create_commit { MessageBroadcastJob.perform_later self }
end
