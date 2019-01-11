class Message < ApplicationRecord
  #callbacks
  after_create_commit { MessageBroadcastJob.perform_later self }

  #validations
  validates :content, presence: true, case_sensitive: false

  #belongs_to
  belongs_to :user
  belongs_to :chatroom

  #Uploaders
  mount_uploader :file, LogoUploader

  def self.create_with_notification(options = {})
    @message = Message.create!(options)
    @notifications = []
    @message.chatroom.users.each do |u|
      byebug
      unless u == @message.user
        @notifications << Notification.create!(user: user, notification_type: NotificationType.new_message, notification_object_id: @message.id)
      end
     end
    [@message, @notifications]
  end
end
