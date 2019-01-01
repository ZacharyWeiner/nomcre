class Notification < ApplicationRecord
  belongs_to :user

  def mark_read
    self.read = true
    self.save!
  end

  def self.check_notifications user_id, notification_type, object_id
    notification = Notification.where(user_id: user_id, notification_type: notification_type, notification_object_id: object_id).first
    unless notification.nil?
      notification.mark_read
    end
  end
end
