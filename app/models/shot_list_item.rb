class ShotListItem < ApplicationRecord
  #belongs_to
  belongs_to :proposal, optional: true
  belongs_to :task, optional: true
  belongs_to :shoot, optional: true
  belongs_to :added_by, class_name: 'User', foreign_key: 'added_by_id'

  #has_one
  has_one :project, through: :shoot
  #has_many


  #mount
  mount_uploader :upload, ShotListUploader
  mount_uploader :reference_image, ShotListUploader

  #instance_methods
  #class_methods

  #helper_methods
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
