class Proposal < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  belongs_to :location
  has_many :tasks
  has_many :proposal_requests
  has_one :chatroom
  paginates_per 20
  mount_uploader :model_release, FileUploader
  has_many :assistants, dependent: :destroy

  accepts_nested_attributes_for :assistants, allow_destroy: true, reject_if: ->(attrs) { attrs['name'].blank? || attrs['paypal_email'].blank? }

  def find_creatives
    creatives =[]
    search_date = Date.today
    creatives = ScheduleItem.where(location: self.location).where("end_date > ?", search_date).map{|si|
      ProposalSearchResult.new(user_id: si.user.id, rank: 3, schedule_item_id: si.id)
    }
    unless self.location.parent_id.nil?
      ScheduleItem.where(location_id: self.location.parent_id).where("end_date > ?", search_date).map{|si|
        creatives << ProposalSearchResult.new(user_id: si.user.id, rank: 2, schedule_item_id: si.id)
      }
    end
    return creatives.sort! { |a, b|  b.rank <=> a.rank }
  end

  def mark_as_complete
    self.complete = true;
    self.save
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
end
