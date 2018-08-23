class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  mount_uploader :file, LogoUploader
  after_create_commit { MessageBroadcastJob.perform_later self }
end
