class Task < ApplicationRecord
  #belongs to
  belongs_to :user
  belongs_to :company
  belongs_to :proposal, optional: true
  belongs_to :shoot, optional: true
  belongs_to :project, optional: true

  #has_one

  #has_many

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

  #-class methods

  #-instance methods
  def approver
    if self.can_accept == 'creative'
      return user
    else
      return company.users.first
    end
  end



  #-helper methods

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
                      shoot: shoot)
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
