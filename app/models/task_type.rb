class TaskType
  include ActiveModel::AttributeMethods

  def self.deliverable
    return 'Deliverable'
  end

  def self.pre_poduction
    return 'Pre Production'
  end

  def self.post_production
    return 'Post Production'
  end

  def self.project
    return 'Project'
  end

  def self.shoot
    return 'Shoot'
  end

  def self.shot_list
    return 'Shot List'
  end
end
