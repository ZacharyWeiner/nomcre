class Task < ApplicationRecord
  #belongs to
  belongs_to :user, optional: true
  belongs_to :shot_list_item, optional: true
  belongs_to :company, optional: true
  belongs_to :proposal, optional: true
  belongs_to :shoot, optional: true
  belongs_to :project, optional: true


  #has_one


  #has_many

  #hooks
  #before_save :update_project
  #after_save  :try_complete

  #scopes
  def project
    proj = nil
    unless self.project_id.nil? || self.project_id == 0
      proj = Project.find(self.project_id)
    end
    unless self.shoot_id.nil? || self.shoot_id == 0
      proj = Shoot.find(shoot_id).project
    end
    proj
  end

  #ActiveRecord Callbacks
  def  update_project
    if self.project_id.nil? && !self.shoot.nil?
      self.project_id = self.shoot.project_id
    end
  end

  def try_complete
    self.try_complete_shoot
    self.try_complete_project
  end

  #instance methods
  def approver
    if self.can_accept == 'creative'
      return user
    else
      return company.users.first
    end
  end

  def try_complete_shoot
    unless self.shoot.nil?
      self.shoot.try_complete
    end
  end

  def try_complete_project
     unless self.project.nil?
      self.project.try_complete
    end
  end

  #helper methods
  def self.create_for_shoot shoot_id
    tasks_count = Task.all.count
    shoot = Shoot.find(shoot_id)
    task_description = "Do something for test shoot " + tasks_count.to_s
    task_deadline = Date.today + 14.days
    task_company = shoot.company
    task_accept = tasks_count % 2 == 0 ? 'creative' : 'company'

    t = Task.create!(user: shoot.company.users.first,
                      description: task_description,
                      deadline: task_deadline,
                      company: task_company,
                      can_accept: task_accept,
                      shoot: shoot,
                      project: shoot.project)
  end

  def self.create_for_project project_id
    tasks_count = Task.all.count
    project = Project.find(project_id)
    task_description = "Do something for test shoot " + tasks_count.to_s
    task_deadline = Date.today + 14.days
    task_company = project.company
    task_accept = tasks_count % 2 == 0 ? 'creative' : 'company'

    t = Task.create!(user: project.company.users.first,
                      description: task_description,
                      deadline: task_deadline,
                      company: task_company,
                      can_accept: task_accept,
                      project: project)
  end
end
