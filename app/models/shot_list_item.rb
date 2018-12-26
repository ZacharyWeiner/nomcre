class ShotListItem < ApplicationRecord
  #belongs_to
  belongs_to :proposal, optional: true
  belongs_to :task, optional: true
  belongs_to :shoot, optional: true
  belongs_to :added_by, class_name: 'User', foreign_key: 'added_by_id', optional: true

  #has_one
  has_one :project, through: :shoot
  #has_many


  #mount
  mount_uploader :upload, ShotListUploader
  mount_uploader :reference_image, ShotListUploader


  after_save :create_task

  #instance_methods
  def copy_from_template
    sli = ShotListItem.create()
  end

  #class_methods

  #helper_methods
  def self.create_all_from_shoot_template shoot_template_id, shoot_id
    shoot_template = Shoot.find(shoot_template_id)
    shoot = Shoot.find(shoot_id)
    shoot_template.shot_list_items.each do |sli|
      new_sli = ShotListItem.new
      new_sli.focus_point = sli.focus_point
      new_sli.description = sli.description
      new_sli.background = sli.background
      new_sli.item_type = sli.item_type
      new_sli.aspect_ratio = sli.aspect_ratio
      new_sli.shoot = shoot
      sli.task = Task.create!(description: sli.task.description, deadline: shoot.deadline, company: shoot.project.company,  user: shoot.project.company.users.first)
      new_sli.save!
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
