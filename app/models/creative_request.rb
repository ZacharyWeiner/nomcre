class CreativeRequest < ApplicationRecord
  validates :accepted, inclusion: { in: [ true, false ] }
  validates :approved, inclusion: { in: [ true, false ] }
  validates :declined, inclusion: { in: [ true, false ] }
  #belongs_to
  belongs_to :shoot
  belongs_to :company
  belongs_to :creative, class_name: 'User', foreign_key: 'creative_id'
  belongs_to :requested_by, class_name: 'User', foreign_key: 'requested_by_id'


  #instance methods
  def accept
    self.accepted = true
    if self.save!
      #TODO - ShootMailer.request_accepted(self).deliver_later!
      Notification.create!(user_id: self.requested_by_id, notification_type: NotificationType.request_accepted, notification_object_id: self.shoot.id, read: false)
      return true
    else
      return false
    end
  end

  def decline
    return_value = false

    self.accepted = false
    self.declined = true

    if self.save!
      return_value =  true
      Notification.create!(user_id: self.requested_by_id, notification_type: NotificationType.request_declined, notification_object_id: shoot.id, read: false)
    end

    return_value
  end

  #helpers
  def self.create_for_shoot( shoot_id: 0, creative_id: 0)
    shoot = Shoot.find(shoot_id)
    request = CreativeRequest.create_with_activity_and_notification(shoot_id: shoot.id, requested_by_id: shoot.company.users.first.id, company_id: shoot.company.id, creative_id: creative_id)
  end

  def self.create_with_activity_and_notification(options = {})
    @creative_request = CreativeRequest.new
    @creative_request.shoot_id = options[:shoot_id] ? options[:shoot_id] : nil
    @creative_request.requested_by_id = options[:requested_by_id] ? options[:requested_by_id] : nil
    @creative_request.creative_id = options[:creative_id] ? options[:creative_id] : nil
    @creative_request.company_id = options[:company_id] ? options[:company_id] : nil
    @creative_request.accepted = false
    @creative_request.approved = false
    @creative_request.declined = false
    if @creative_request.save!
      UserActivity.create!(user_id: options[:creative_id], activity_type: UserActivityType.shoot_request, object_id: options[:shoot_id])
      @creative_request.notify_requested_creative
    end
    @creative_request
  end

  def notify_requested_creative
    #TODO - Create Email Notification
    p 'Sending Shoot Request Email Notificaiton'
    #ShootMailer.request_created(self).deliver_later!
    #TODO: Send an SMS Message to the Creative with Link to Accept
    Notification.create!(user: self.creative, notification_type: NotificationType.new_work_request, notification_object_id: self.id, read: false)
  end
end
