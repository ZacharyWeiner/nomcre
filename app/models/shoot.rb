class Shoot < ApplicationRecord
  #belongs_to
  belongs_to :project
  belongs_to :company
  belongs_to :location, optional: true
  belongs_to :creative, foreign_key: 'creative_id', class_name: 'User', optional: true

  #has_one
  has_one :chatroom, :dependent => :destroy

  #has_many
  has_many :documents
  has_many :assistants
  has_many :tasks, :dependent => :destroy
  has_many :shot_list_items, :dependent => :destroy
  has_many :creative_requests, :dependent => :destroy


  #callbacks
  before_destroy :orphan_relations


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
    family_tree = [self.location.id]
    children = []
    siblings = []
    newphews = []
    grand_children = []

    unless self.location.parent.nil?
      family_tree << self.location.parent_id

      #TODO: Figure out how to rank parent
      siblings << self.location.parent_id
    end
    if !self.location.parent.nil?
      self.location.parent.children.map { |e|
        family_tree << e.id
        siblings << e.id
      }
      self.location.parent.children.each do |sibling|
        sibling.children.map { |e|
          family_tree << e.id
          newphews << e.id
        }
      end
    end
    self.location.children.map { |e|
      family_tree << e.id
      children << e.id
    }
    self.location.children.each do |child|
      child.children.map { |e|
        family_tree << e.id
        grand_children << e.id
      }
    end
    p family_tree

    creatives = User.joins(:schedule_items).where(schedule_items: { location_id: family_tree, start_date: (Date.today - 2.years)..self.deadline, end_date: (Date.today)..self.deadline + 1.year  }).uniq
    creatives_ranked = []
    creatives.each do |c|
      #if the location is a match rank 1
      item = c.schedule_items.where(schedule_items: { location_id: self.location_id, start_date: (Date.today - 2.years)..self.deadline, end_date: (Date.today)..self.deadline + 1.year  }).first
      if !item.nil?
        creatives_ranked << CreativeSearchResult.new(user_id: c.id, rank:1, schedule_item_id: item.id)
      else
        #if the location is a child rank of  2
        item = c.schedule_items.where(schedule_items: { location_id: children, start_date: (Date.today - 2.years)..self.deadline, end_date: (Date.today)..self.deadline + 1.year  }).first
        if !item.nil?
          creatives_ranked << CreativeSearchResult.new(user_id: c.id, rank:2, schedule_item_id: item.id)
        else
          #if the location is a sibling || parent of rank 3
          item = c.schedule_items.where(schedule_items: { location_id: siblings, start_date: (Date.today - 2.years)..self.deadline, end_date: (Date.today)..self.deadline + 1.year  }).first
          if !item.nil?
            creatives_ranked << CreativeSearchResult.new(user_id: c.id, rank:3, schedule_item_id: item.id)
          else
            item = c.schedule_items.where(schedule_items: { location_id: newphews, start_date: (Date.today - 2.years)..self.deadline, end_date: (Date.today)..self.deadline + 1.year  }).first
            if !item.nil?
              creatives_ranked << CreativeSearchResult.new(user_id: c.id, rank:4, schedule_item_id: item.id)
            end
          end
        end
      end
    end
    creatives_ranked.sort_by{ |obj| obj.rank }
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
    justin = User.where(email: 'justin@nomcre.com').first
    if !justin.nil?
      message = chatroom.messages.create!(content: "Justin Joined The Chat", user: justin)
    end
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

  def has_request_for_creative user_id
    request = self.creative_requests.where(creative_id: user_id).first != nil
  end

  def request_for_creative user_id
    self.creative_requests.where(creative_id: user_id).first
  end

  def creative_accepted_request creative_id
    !self.creative_requests.where({creative_id: creative_id, accepted: true}).first.nil?
  end

  #rules
  def owner_added_shot_list_count
    company_ids = self.project.owners.map{|u| u.id}
    self.shot_list_items.where(added_by: company_ids).count
  end

  def nomcre_added_shot_list_count
    self.shot_list_items.where(added_by: nil).count
  end

  def owner_added_shot_list
    company_ids = self.project.owners.map{|u| u.id}
    self.shot_list_items.where(added_by: company_ids)
  end


  #callbacks
  def orphan_relations
    self.assistants.each do |assistant|
      assistant.shoot = nil
      assistant.save
    end
    self.documents.each do |doc|
      doc.shoot_id = nil
      doc.save!
    end
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
      ShotListItem.create_all_from_shoot_template shoot_template.id, shoot.id
    end
  end
end
