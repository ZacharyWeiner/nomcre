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
    #TODO: Change this to a tag based system so ranking and location based is irrelevant
    #TODO: Update To Search for Children of a location also. If "China" people in Beijing should be returned also
    creatives = Hash.new
    search_date = self.deadline
    search_location = self.location
    results  = ScheduleItem.where('location_id = ? and end_date > ? and  start_date < ?', search_location,  search_date, search_date)
    p "Shoot::FindCreatives -- THERE ARE : #{results.count} RESULTS"

    results.each do |si|
      creatives[si.user.id] =  CreativeSearchResult.new(user_id: si.user.id, rank: 1, schedule_item_id: si.id)
    end
    if !search_location.parent.nil?
      search_location = self.location.parent
      p "Shoot::FindCreatives -- This Location Has A Parent"
      results  = ScheduleItem.where('location_id = ? and end_date > ? and  start_date < ?', search_location,  search_date, search_date)
      p "Shoot::FindCreatives -- #{search_location.name} Has #{results.count} Results"
      results.each do |r|
        unless creatives[si.user.id].nil?
          creatives << CreativeSearchResult.new(user_id: si.user.id, rank: 2, schedule_item_id: si.id)
        end
      end
    end
    if !search_location.parent.nil?
      search_location = self.location.parent
      p "Shoot::FindCreatives -- This Location Has A Parent"
      results  = ScheduleItem.where('location_id = ? and end_date > ? and  start_date < ?', search_location,  search_date, search_date)
      p "Shoot::FindCreatives -- #{search_location.name} Has #{results.count} Results"
      results.each do |si|
         unless creatives[si.user.id].nil?
          creatives << CreativeSearchResult.new(user_id: si.user.id, rank: 3, schedule_item_id: si.id)
        end
      end
    end
    return creatives.sort_by { |a, b|  b <=> a }
  end

  def assign_from_request request_id
    assigned_request = CreativeRequest.find(request_id)
    creative = assigned_request.creative
    unless creative.nil?
      self.creative = creative
      if self.save!
        assigned_request.approved = true
        assigned_request.save!
        self.assign_chatroom creative
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

  def assign_chatroom creative
    chatroom = Chatroom.create!(topic: self.project.title + "-" + self.content_type, shoot: self)
    message = chatroom.messages.create!(content: "#{chatroom.shoot.company.name} Joined The Chat", user: chatroom.shoot.company.users.first)
    message = chatroom.messages.create!(content: "#{creative.user_profile.display_name} Joined The Chat", user: creative)
  end

  def creatives_in_location
  end

  def can_assign_creative
    can_assign = false
    if !self.project.nil? && self.project.deposit_is_paid
      can_assign = true
    end
    return can_assign
  end

  def has_request_for_user user_id
    request = self.creative_requests.where(creative_id: user_id).first != nil
  end

  def request_for_user user_id
    self.creative_requests.where(creative_id: user_id).first
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
      shoot.deadline = project.deadline - 5.days
      shoot.save!
      p 'saved new shoot'
      ShotListItem.create_all_from_shoot_template shoot_template.id, shoot.id
      #TODO: Add Shot List Items From Template Shoot to Active Shoot
    end
  end
end
