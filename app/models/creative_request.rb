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
      Notification.create!(user_id: self.requested_by_id, notification_type: NotificationType.request_accepted, notification_object_id: shoot.id, read: false)
      return true
    else
      return false
    end
  end

  def decline
    self.accepted = false
    self.declined = true
    if self.save!
      return true
    else
      return false
    end
  end

  #helpers
  def self.create_for_shoot( shoot_id: 0, creative_id: 0)
    shoot = Shoot.find(shoot_id)
    request = CreativeRequest.create!(shoot_id: shoot.id, requested_by_id: shoot.company.users.first.id, company_id: shoot.company.id, creative_id: creative_id)
    request.notify_requested_creative
  end

  def notify_requested_creative
    #Create Platfrom Notification
    Notification.create!(user: self.creative, notification_type: NotificationType.new_work_request, notification_object_id: shoot.id, read: false)

    #TODO - Create Email Notification
    p 'Sending Shoot Request Email Notificaiton'
    #ShootMailer.request_created(self).deliver_later!

    #TODO: Send an SMS Message to the Creative with Link to Accept
  end
end
