class Proposal < ApplicationRecord
  include ProposalsHelper
  belongs_to :company
  belongs_to :user, optional: true
  belongs_to :location
  has_many :tasks, dependent: :destroy
  has_many :proposal_requests, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  paginates_per 10
  mount_uploader :model_release, DisclosureUploader
  has_many :assistants, dependent: :destroy
  has_many :shot_list_items, dependent: :destroy
  has_many :documents

  accepts_nested_attributes_for :assistants, allow_destroy: true, reject_if: ->(attrs) { attrs['name'].blank? || attrs['paypal_email'].blank? }
  validates :proposal_type, presence: true
  def find_creatives
    creatives =[]
    search_date = self.deadline
    creatives = ScheduleItem.where(location: self.location).where("end_date > ?", search_date).map{|si|

      ProposalSearchResult.new(user_id: si.user.id, rank: 3, schedule_item_id: si.id)
    }
    unless self.location.parent_id.nil?
      ScheduleItem.where(location_id: self.location.parent_id).where("end_date > ?", search_date).map{|si|
        creatives << ProposalSearchResult.new(user_id: si.user.id, rank: 2, schedule_item_id: si.id)
      }
      parent = Location.find(location.parent_id);
      unless parent.nil?
        ScheduleItem.where(location_id: parent.parent_id).where("end_date > ?", search_date).map{|si|
          creatives << ProposalSearchResult.new(user_id: si.user.id, rank: 1, schedule_item_id: si.id)
        }
      end
    end
    return creatives.sort! { |a, b|  b.rank <=> a.rank }
  end

   #Payment
  def self.deposit_percent
    return 0.60
  end

  def self.balance_percent
    return 0.40
  end

  def mark_as_complete
    self.completed = true;
    self.save
  end

  def is_info_complete
    is_complete = true;
    if self.title.nil? || self.title == ""
      is_complete = false
    end

    if self.location.nil?
      is_complete = false
    end

    if self.deadline.nil?
      is_complete = false
    end

    if self.content.nil? || self.content == ""
      is_complete = false
    end

    if self.shoot_type.nil? || self.shoot_type == ""
      is_complete = false;
    end

    if self.proposal_type.nil? || self.proposal_type == ""
      is_complete = false
    end

    if self.background.nil? || self.background == ""
      is_complete = false
    end

    if self.shot_list_items.count == 0
      is_complete = false
    end

    return is_complete
  end

  def is_editable
    is_editable = true
    if self.deposit_paid? && self.user.nil? == false
      is_editable = false
    end
    is_editable
  end

  def status
    status = 'More Info Needed'
    if self.is_info_complete
      status = 'Ready To Begin'
    end
     if self.shot_list_items.count > 0 && self.shot_list_items.count < self.shot_count
      status = "Edit Shot List"
    end
    if self.deposit_paid == true
      status = 'Deposit Paid'
    end
    if self.user != nil
      status = "In Process"
    end
    if self.paid
      status = "Balance Paid"
    end
    if self.completed
      status = "Complete"
    end
    status
  end

  def next_step status
    next_step = ''
    if status == 'More Info Needed'
      next_step = "Complete The Brief"
    elsif status == 'Ready To Begin'
      next_step = 'Create Your Shot List'
    elsif status == 'Edit Shot List'
      next_step = 'Add To Your Shot List'
    elsif status == 'Deposit Paid'
      next_step = 'Select A Creative'
    elsif status == 'In Process'
      next_step = "Pay Balance"
    elsif status == 'Balance Paid'
      next_step = 'Receive Your Asset Library'
    elsif status == 'Complete'
      next_step = ''
    end
    next_step
  end

  def create_tasks
    if self.proposal_type = "Photo"
      # PreProduction Company
      self.tasks.create!(company: self.company, description: "Say Hi To Your New Collaborator!", deadline: self.deadline, completed: false, user:self.company.users.first, task_type: 'Pre-Production', can_accept: 'company')
      self.tasks.create!(company: self.company, description: "Ship The Product", deadline: self.deadline, completed: false, user:self.company.users.first, task_type: 'Pre-Production', can_accept: 'company')
      # PreProduction Creative
      self.tasks.create!(company: self.company, description: "Say Hi To Our Client", deadline: self.deadline, completed: false, user:self.user, task_type: 'Pre-Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Add Your Shipping Address", deadline: self.deadline, completed: false, user:self.user, task_type: 'Pre-Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Read the Brief and Clarify Any Questions", deadline: self.deadline, completed: false, user:self.user, task_type: 'Pre-Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Planning - Scout Location", deadline: self.deadline, completed: false, user:self.user, task_type: 'Pre-Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Planning - Confirm Models ", deadline: self.deadline, completed: false, user:self.user, task_type: 'Pre-Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Planning - Confirm HMU/Stylist ", deadline: self.deadline, completed: false, user:self.user, task_type: 'Pre-Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Planning - Gear Check", deadline: self.deadline, completed: false, user:self.user, task_type: 'Pre-Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Add Model/Styleist/HMU Conatact & PayPal Info", deadline: self.deadline, completed: false, user:self.user, task_type: 'Pre-Production', can_accept: 'creative')

      #Production Company
      self.tasks.create!(company: self.company, description: "Review communication from Creator ", deadline: self.deadline, completed: false, user:self.company.users.first, task_type: 'Production', can_accept: 'company')
      #Production Creative
      self.tasks.create!(company: self.company, description: "Send Client On Site BTS on the start of shoot day", deadline: self.deadline, completed: false, user:self.user, task_type: 'Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Upload Model Release Video", deadline: self.deadline, completed: false, user:self.user, task_type: 'Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Confirm Shot List Covered ", deadline: self.deadline, completed: false, user:self.user, task_type: 'Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Shoot BTS Photos / Videos ", deadline: self.deadline, completed: false, user:self.user, task_type: 'Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Collect BTS From Assistants, etc...", deadline: self.deadline, completed: false, user:self.user, task_type: 'Production', can_accept: 'creative')

      #Post Production Company
      self.tasks.create!(company: self.company, description: "Review Uploaded Content", deadline: self.deadline, completed: false, user:self.company.users.first, task_type: 'Post-Production', can_accept: 'company')

      #Post Production Creative
      self.tasks.create!(company: self.company, description: "Upload Selects For Shot List", deadline: self.deadline, completed: false, user:self.user, task_type: 'Post-Production', can_accept: 'creative')
      self.tasks.create!(company: self.company, description: "Upload Sharelink for Full Content Dump", deadline: self.deadline, completed: false, user:self.user, task_type: 'Post-Production', can_accept: 'creative')
    elsif self.proposal_type == "Video"
      self.tasks.create!(company: self.company, description: "Video Task 1", deadline: self.deadline, completed: false, user:self.user)
      self.tasks.create!(company: self.company, description: "Video Task 1", deadline: self.deadline, completed: false, user:self.user)
      self.tasks.create!(company: self.company, description: "Video Task 1", deadline: self.deadline, completed: false, user:self.user)
      self.tasks.create!(company: self.company, description: "Video Task 1", deadline: self.deadline, completed: false, user:self.user)
    elsif self.proposal_type == "Drone"
      self.tasks.create!(company: self.company, description: "Drone Task 1", deadline: self.deadline, completed: false, user:self.user)
      self.tasks.create!(company: self.company, description: "Drone Task 1", deadline: self.deadline, completed: false, user:self.user)
      self.tasks.create!(company: self.company, description: "Drone Task 1", deadline: self.deadline, completed: false, user:self.user)
      self.tasks.create!(company: self.company, description: "Drone Task 1", deadline: self.deadline, completed: false, user:self.user)
    end
  end

  #Users
  def assign_user user_id
    self.user = User.find(user_id)
    self.accepted = true
    self.save
    self.send_assigned_notifications(user_id)
  end

  def send_assigned_notifications user_id
    user = User.find(user_id)
    self.send_notification(user_id, "New Message", self.chatroom.id)
    self.send_notification(user_id, "Proposal Assigned", self.id)
    self.send_notification(user_id, "Task", self.id)
  end


  def send_notification(user_id, notification_type, request_id)
    notification = Notification.where(user_id: user_id, notification_type: notification_type, notification_object_id: request_id).first
    if notification.nil?
      notification = Notification.create!(user_id: user_id, notification_type: notification_type, notification_object_id: request_id, read: false)
    end
  end
end
