class Project < ApplicationRecord
  #belongs_to
  belongs_to :package_type
  belongs_to :company

  #has_one

  #has_many
  has_many :payments
  has_many :invoices
  has_many :shoots, :dependent => :destroy
  has_many :creatives, through: :shoots
  has_many :chatrooms, through: :shoots
  has_many :messages, through: :chatrooms
  has_many :documents, through: :shoots
  has_many :assistants, through: :shoots
  has_many :shot_list_items, through: :shoots
  has_many :locations, through: :shoots
  has_and_belongs_to_many :discount_codes

  #scopes
  scope :templates, -> {where(is_template:true)}

  #callbacks
  after_create :initalize_project
  after_save :update_shoots


  def owners
    self.company.users
  end

  def tasks
    shoot_ids = self.shoots.map{|s| s.id}
    Task.where(shoot_id: shoot_ids).or(Task.where(project_id: self.id))
  end

  def is_editable user
    if user.role == 0
      return true
    end

    can_edit = false
    if self.company.users.where(id: user.id).count > 0
      if !self.deposit_is_paid
        can_edit = true
      end
    end
    can_edit
  end


  #instance methods
  def user_added_shot_list_items_count
    count = 0
    self.shoots.each do |s|
      count = count + s.owner_added_shot_list_count
    end
    count
  end

  def user_added_shot_list_items_max
    count = 0
    self.shoots.each do |s|
      if !s.nil? && s.user_added_shot_count_max.to_i != nil
      count = count + s.user_added_shot_count_max.to_i
      end
    end
    count
  end

  #tasks
  def all_tasks_complete
    self.tasks.where(completed: nil).count == 0
  end

  def try_complete
    if self.all_tasks_complete && self.is_paid_in_full
      self.completed = true
      self.save
    end
  end

  def complete_project
    #TODO: Complete Project Mrthod
    p 'TODO: Complete Project Method'
    throw err;
  end

  ##Finance
  def udpdate_price
    #TODO - Update Price
    p 'TODO: Project Update Price Method'
    throw err;
  end

  def is_paid_in_full
    (self.deposit_is_paid && self.balance_is_paid) ? true : false
  end

  def deposit_payment
    self.payments.where(payment_type: 'deposit').first
  end

  def deposit_is_paid
    !self.payments.where(payment_type: 'deposit').first.nil?
  end

  def deposit_paid_on
    date = nil
    if self.desposit_is_paid
      date = self.deposit_payment.paid_on
    end
    date
  end

  def balance_payment
    self.payments.where(payment_type: 'balance').first
  end

  def balance_is_paid
    !self.payments.where(payment_type: 'balance').first.nil?
  end

  def balance_paid_on
    date = nil
    if self.balance_is_paid
      date = self.balance_payment.paid_on
    end
    date
  end

  def deposit_invoice
    self.invoices.where(invoice_type: 'deposit').first
  end

  def balance_invoice
    self.invoices.where(invoice_type: 'balance').first
  end


  #class_methods
  def self.create_from_template company_id, package_type_id, deadline
    package = PackageType.find(package_type_id)
    company = Company.find(company_id)
    template = package.default_template

    project = Project.new
    project.package_type = package
    project.is_template = false
    project.is_default_template = false
    project.company = company
    project.title = "#{package.title} - #{deadline}"
    project.price = 15000
    project.deadline = deadline
    project.brief = template.brief
    project.save!
    Shoot.create_shoots_from_template template.id, project.id
    project
  end


  #helpers
  def initalize_project
    #TODO: Init the project after user enters the
    p "TODO: Init the project after user enters the"
    #create inital shot list items
    #create additional tasks
    #create a chatroom
    #set price
  end

  def update_shoot_location location_id
    self.shoots.each do |s|
      if !s.user_saved
        s.location_id = location_id
        s.save
      end
    end
  end

  def update_shoots
    self.shoots.each do |s|
      if !s.user_saved == true
        s.brief = self.brief
        s.save
      end
    end
  end

  def self.create_template_for_type package_type_id
    package = PackageType.find(package_type_id)
    project = Project.new
    project.package_type = package
    project.is_template = true
    project.is_default_template = true
    project.company_id = 1
    project.title = "Default #{package.title} Project Template"
    project.price = 15000
    project.save!
    project
  end

  def create_shoots_for_template
    shoot = Shoot.new
    shoot.project = self
    shoot.company_id = 1
    shoot.location_id = 111
    shoot.content_type = 'photo'
    shoot.brief = 'An explanation of what this photo shoot and brief should entail'
    shoot.price = 5000
    shoot.user_added_shot_count_max = 100
    shoot.save!


    shoot = Shoot.new
    shoot.project = self
    shoot.location_id = 111
    shoot.company_id = 1
    shoot.content_type = 'video'
    shoot.brief = 'An explanation of what this video shoot and brief should entail'
    shoot.price = 5000
    shoot.user_added_shot_count_max = 100
    shoot.save!
  end

end
