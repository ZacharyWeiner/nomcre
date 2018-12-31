class Shoot < ApplicationRecord
  #belongs_to
  belongs_to :project
  belongs_to :company
  belongs_to :location, optional: true
  belongs_to :creative, foreign_key: 'creative_id', class_name: 'User', optional: true

  #has_one
  has_one :chatroom

  #has_many
  has_many :documents
  has_many :assistants
  has_many :tasks
  has_many :shot_list_items
  has_many :creative_requests


  #instance_methods
  def deadline
    self.project.deadline
  end

  def is_editable
    (!self.project.deposit_is_paid || self.creative.nil?) ? true : false
  end

  #tasks
  def all_tasks_complete
    self.tasks.where(completed: nil).count == 0
  end

  def try_complete
    if self.all_tasks_complete
      self.is_complete = true
      self.save
    end
  end

  #collections
  def pending_requests
    CreativeRequest.where(shoot: self).where(accepted: nil).where(declined: nil)
  end
  def accepted_requests
    CreativeRequest.where(shoot: self).where(accepted: true)
  end

  #search
  def find_creatives
    creatives =[]
    search_date = self.deadline
    creatives = ScheduleItem.where(location: self.location).where("end_date > ?", search_date).map{|si|

      CreativeSearchResult.new(user_id: si.user.id, rank: 3, schedule_item_id: si.id)
    }
    unless self.location.parent_id.nil?
      ScheduleItem.where(location_id: self.location.parent_id).where("end_date > ?", search_date).map{|si|
        creatives << CreativeSearchResult.new(user_id: si.user.id, rank: 2, schedule_item_id: si.id)
      }
      parent = Location.find(location.parent_id);
      unless parent.nil?
        ScheduleItem.where(location_id: parent.parent_id).where("end_date > ?", search_date).map{|si|
          creatives << CreativeSearchResult.new(user_id: si.user.id, rank: 1, schedule_item_id: si.id)
        }
      end
    end
    return creatives.sort! { |a, b|  b.rank <=> a.rank }
  end

  def has_request_for_user user_id
    request = self.creative_requests.where(creative_id: user_id).first != nil
  end

  #rules
  def owner_added_shot_list_count
    company_ids = self.project.owners.map{|u| u.id}
    self.shot_list_items.where(added_by: company_ids).count
  end

  def owner_added_shot_list
    company_ids = self.project.owners.map{|u| u.id}
    self.shot_list_items.where(added_by: company_ids)
  end

  #class methods
  def self.create_shoots_from_template template_project_id, parent_project_id
    template_project = Project.find(template_project_id)
    project = Project.find(parent_project_id)
    template_project.shoots.each do |shoot_template|
      shoot = Shoot.new
      shoot.project = project
      shoot.company = project.company
      shoot.location_id = 111
      shoot.content_type = shoot_template.content_type
      shoot.brief = shoot_template.brief
      shoot.price = shoot_template.price
      shoot.shoot_style = shoot_template.shoot_style
      shoot.user_added_shot_count_max = shoot_template.user_added_shot_count_max
      shoot.save!
      p 'saved new shoot'
      ShotListItem.create_all_from_shoot_template shoot_template.id, shoot.id
      #TODO: Add Shot List Items From Template Shoot to Active Shoot
    end
  end
end
