class ShotListItem < ApplicationRecord
  validate :description_or_reference
  validates :reference_image, file_size: { less_than_or_equal_to: 15.megabytes }
  before_destroy :orphan_relations
  #validation
  # validates :description, presence: true

  #belongs_to
  belongs_to :proposal, optional: true
  belongs_to :task_group, optional: true

  belongs_to :shoot
  belongs_to :added_by, class_name: 'User', foreign_key: 'added_by_id'
  has_one :task

  #has_one
  has_one :project, through: :shoot


  #has_many



  #mount
  mount_uploader :upload, ShotListUploader
  mount_uploader :reference_image, ShotListUploader


  def description_or_reference
    if description.blank? && reference_image.file.nil?
      errors.add(:description, "Shot List Items require a description or a reference image")
    end
  end
  #instance_methods
  def copy_from_template
    sli = ShotListItem.create()
  end

  def create_related_task params={}
    description = params[:description].nil? ? self.description : params[:description]
    user_id = params[:user_id].nil? ? self.shoot.company.users.first.id : params[:user_id]
    can_accept = params[:can_accept].nil? ? UserType.creative : params[:can_accept]
    task = Task.create!(shoot_id: self.shoot.id,
                        shot_list_item_id: self.id,
                         description: description,
                         project_id: self.shoot.project_id,
                         user_id: user_id, #self.shoot.company.users.first.id,
                         company: self.shoot.company,
                         can_accept: can_accept,
                         task_type: TaskType.shot_list,
                         task_group: self.task_group,
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
    shoot_template.task_groups.where(parent_id: nil).each do |tg|
      shoot.task_groups << TaskGroup.create!(title: tg.title, shoot: shoot, order: tg.order)
    end
    shoot_template.task_groups.where.not(parent_id: nil).each do |tg|
      parent = shoot.task_groups.where(title:tg.parent.title).first
      new_tg = TaskGroup.create!(title: tg.title, order: tg.order, shoot: shoot, parent: parent)
    end
    p "Items Count: #{shoot_template.shot_list_items.count}"
    admin = User.where(role:0).first
    shoot_template.shot_list_items.each do |sli|
      if !sli.task_group.nil?
        if shoot.task_groups.where(title: sli.task_group.title).count == 0
          order = shoot.task_groups.count
          task_group = TaskGroup.create(title: sli.task_group.title, shoot: shoot, order: order)
        else
          task_group = shoot.task_groups.where(title: sli.task_group.title).first
        end
      end
      unless sli.description.nil?
        new_sli = ShotListItem.new
        new_sli.focus_point = sli.focus_point
        new_sli.description = sli.description
        new_sli.background = sli.background
        new_sli.item_type = sli.item_type
        new_sli.aspect_ratio = sli.aspect_ratio
        new_sli.shoot = shoot
        new_sli.added_by = admin
        new_sli.task_group = task_group
        if new_sli.save!
          new_sli.create_related_task
        end
      end
    end
  end

  def self.create_for_shoot shoot_id
    sli_count = ShotListItem.all.count
    shoot = Shoot.find(shoot_id)
    sli_description = 'Shot List Item #' + sli_count.to_s
    sli_type = shoot.content_type

    # task = Task.create!(user: shoot.company.users.first,
    #                     description: 'Task for' + sli_description,
    #                     company: shoot.company,
    #                     shoot: shoot)

    sli = ShotListItem.create!(description: sli_description,
                          item_type: sli_type,
                          shoot: shoot,
                          added_by: shoot.company.users.first)
    sli.create_related_task
    sli
  end
end
