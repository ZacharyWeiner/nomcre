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
  has_many :tasks, :dependent => :destroy
  has_many :shot_list_items, :dependent => :destroy
  has_many :creative_requests, :dependent => :destroy


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
    search_location = self.location
    results  = ScheduleItem.where('location_id = ? and end_date > ? and  start_date < ?', search_location,  search_date, search_date)
    p "Shoot::FindCreatives -- THERE ARE : #{results.count} RESULTS"

    results.each do |si|
      creatives << CreativeSearchResult.new(user_id: si.user.id, rank: 1, schedule_item_id: si.id)
    end
    if !search_location.parent.nil?
      search_location = self.location.parent
      p "Shoot::FindCreatives -- This Location Has A Parent"
      results  = ScheduleItem.where('location_id = ? and end_date > ? and  start_date < ?', search_location,  search_date, search_date)
      p "Shoot::FindCreatives -- #{search_location.name} Has #{results.count} Results"
      results.each do |r|
        creatives << CreativeSearchResult.new(user_id: si.user.id, rank: 2, schedule_item_id: si.id)
      end
    end
    if !search_location.parent.nil?
      search_location = self.location.parent
      p "Shoot::FindCreatives -- This Location Has A Parent"
      results  = ScheduleItem.where('location_id = ? and end_date > ? and  start_date < ?', search_location,  search_date, search_date)
      p "Shoot::FindCreatives -- #{search_location.name} Has #{results.count} Results"
      results.each do |si|
        creatives << creatives << CreativeSearchResult.new(user_id: si.user.id, rank: 3, schedule_item_id: si.id)
      end
    end
    return creatives.sort! { |a, b|  b.rank <=> a.rank }
  end

  def assign_from_request request_id
    assigned_request = CreativeRequest.find(request_id)
    creative = assigned_request.creative
    unless creative.nil?
      self.creative = creative
      if self.save!
        assigned_request.approved = true
        assigned_request.save!
        self.creative_requests.where.not(creative_id: creative.id).each do |cr|
          cr.approved = false
          cr.save!
        end
        return true
      else
        return false
      end
    end
  end

  def creatives_in_location
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
