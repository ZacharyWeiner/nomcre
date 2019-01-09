class ShotListItem < ApplicationRecord
  before_destroy :orphan_relations
  #validation
  validates :description, presence: true

  #belongs_to
  belongs_to :proposal, optional: true

  belongs_to :shoot
  belongs_to :added_by, class_name: 'User', foreign_key: 'added_by_id'
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
      new_sli.added_by = @shoot.company.users.first
      if new_sli.save!

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

    sli
  end
end
