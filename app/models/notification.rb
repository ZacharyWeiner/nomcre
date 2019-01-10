class Notification < ApplicationRecord
  #validations
  validates :notification_type, presence: true
  validates :notification_object_id,         numericality: { other_than: 0 }

  #belongs_to
  belongs_to :user

  def mark_read
    self.read = true
    self.save!
  end

  def self.mark_all_read_for_user user_id
    @user = User.find(user_id)
    @user.notifications.each do |note|
      note.mark_read
    end
  end

  def self.check_notifications user_id, notification_type, object_id
    notification = Notification.where(user_id: user_id, notification_type: notification_type, notification_object_id: object_id).first
    unless notification.nil?
      notification.mark_read
    end
  end

  def construct_link
    case self.notification_type
    when NotificationType.task
      @task = Task.find(self.notification_object_id)
      task_path(@task)
    when NotificationType.new_message
      @message = Message.find(self.notification_object_id)
      chatroom_path(@message.chatroom)
    when NotificationType.new_work_request
      creative_requests_path
    when NotificationType.request_assigned
      shoot_path(self.notification_object_id)
    when NotificationType.request_accepted
      @shoot = Shoot.find(self.notification_object_id)
      shoot_path(@shoot)
    when NotificationType.request_declined
      creative_requests_path
    when NotificationType.payment_made
      payment_path(self.notification_object_id)
    else
      root_path
    end
  end

end
