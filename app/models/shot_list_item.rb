class ShotListItem < ApplicationRecord
  before_destroy :orphan_relations
  #validation
  validates :description, presence: true

  #belongs_to
  belongs_to :proposal, optional: true

  belongs_to :shoot, optional: true
  belongs_to :added_by, class_name: 'User', foreign_key: 'added_by_id', optional: true
  belongs_to :task, optional: true

  #has_one
  has_one :project, through: :shoot
  has_one :task


  #has_many



  #mount
  mount_uploader :upload, ShotListUploader
  mount_uploader :reference_image, ShotListUploader



  #instance_methods
  def copy_from_template
    sli = ShotListItem.create()
  end

  def create_related_task description
    task = Task.create!(shoot_id: self.shoot.id,
                        shot_list_item_id: self.id,
                         description: description,
                         project_id: self.shoot.project_id,
                         user_id: self.shoot.company.users.first.id,
                         company: self.shoot.company,
                         can_accept: UserType.creative,
                         task_type: TaskType.shot_list,
                         is_template: false )
    task
  end

  def orphan_relations
    if !self.task.nil?
      self.task = nil
      self.save!
    end
  end

  #class_methodsTask

  #helper_methods
  def self.create_all_from_shoot_template shoot_template_id, shoot_id
    p 'Creating Shot List Items'
    shoot_template = Shoot.find(shoot_template_id)
    shoot = Shoot.find(shoot_id)
    p "Items Count: #{shoot_template.shot_list_items.count}"
    shoot_template.shot_list_items.each do |sli|
      new_sli = ShotListItem.new
      new_sli.focus_point = sli.focus_point
      new_sli.description = sli.description
      new_sli.background = sli.background
      new_sli.item_type = sli.item_type
      new_sli.aspect_ratio = sli.aspect_ratio
      new_sli.shoot = shoot
      task_type = ''
      task_can_accept = ''
      task_description = "#{sli.description} - Task "
      if new_sli.save!
        if sli.task.nil?
          new_sli.create_related_task(task_description)
        else
          new_sli_task = sli.task.clone
          new_sli_task.company == new_sli.shoot.company
          new_sli_task.project = new_sli.shoot.project
          new_sli_task.deadline = new_sli.shoot.deadline
          new_sli_task.shot_list_item = self
          new_sli_task.save!
        end
      end
    end
  end

  def self.create_for_shoot shoot_id
    sli_count = ShotListItem.all.count
    shoot = Shoot.find(shoot_id)
    sli_description = 'Shot List Item #' + sli_count.to_s
    sli_type = shoot.content_type

    task = Task.create!(user: shoot.company.users.first,
                        description: 'Task for' + sli_description,
                        company: shoot.company,
                        shoot: shoot)

    sli = ShotListItem.create!(description: sli_description,
                          item_type: sli_type,
                          task: task,
                          shoot: shoot,
                          added_by: shoot.company.users.first)

    sli
  end
end
