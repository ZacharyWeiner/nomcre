class Shoot < ApplicationRecord
  #callbacks
  after_create :intialize_shoot
  before_destroy :deconstruct

  validates :price,                     numericality: { other_than: 0 }
  validates :user_added_shot_count_max, numericality: { other_than: 0 }
  validates :deadline,                  inclusion: { in: (Date.today+7.days..Date.today+5.years) }

  #belongs_to
  belongs_to :project
  belongs_to :company
  belongs_to :location
  belongs_to :creative, foreign_key: 'creative_id', class_name: 'User', optional: true

  #has_one
  has_one :chatroom, dependent: :destroy

  #has_many
  has_many :documents
  has_many :assistants
  has_many :tasks, :dependent => :destroy
  has_many :shot_list_items, :dependent => :destroy
  has_many :creative_requests, :dependent => :destroy


  #instance_methods
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
    CreativeRequest.where(shoot: self).where(accepted: false).where(declined: false)
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

  #TODO: Clean Up assign_from_request
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
        Notification.create!(user: assigned_request.creative, notification_type: NotificationType.request_assigned, notification_object_id: self.id)
        return true
      else
        return false
      end
    end
  end

  def assign_chatroom creative
    chatroom = Chatroom.create_for_shoot(topic: self.project.title + "-" + self.content_type, shoot_id: self.id)
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
  def intialize_shoot
    set_default_shot_list
  end

  def deconstruct
    orphan_relations
    destroy_chatroom
    if self.project.price > 0
      self.project.update_price(self.project.price - self.price)
    end
  end

  def destroy_chatroom
    chatroom = self.chatroom
    unless chatroom.nil?
      chatroom.messages.destroy_all
      chatroom.destroy!
    end
  end

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

  def set_default_shot_list
    if self.content_type == ContentType.photo
      create_default_shot_list_for_photo
    elsif self.content_type == ContentType.video
      create_default_shot_list_for_video
    end
  end

  def create_default_shot_list_for_photo
    sli = ShotListItem.create!(shoot: self,
                          description:'Logo shot detail',
                          aspect_ratio:'portrait',
                           background:"On Set Or At Location",
                           focus_point: 'Center',
                          added_by: self.company.users.first
                           )
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Logo shot detail',
                          aspect_ratio:'landscape',
                           background:"On Set Or At Location",
                           focus_point: 'Center',
                          added_by: self.company.users.first
                           )
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Establishing shot wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Establishing shot wide (lots of sky)',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Establishing shot medium',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Establishing shot tight - landscape',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Establishing shot tight - portrait',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Atmosphere Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Middle Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Middle Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Top Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Bottom Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Far Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Far Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Middle Top',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Middle Bottom',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Dead Center',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Low To High',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Low To High',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Low To High',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: ['Top'],
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: ['Bottom'],
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Establishing Shot of Location',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Top',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Establishing Shot of Location',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Bottom',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Establishing Shot of Location',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Establishing Shot of Location',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Establishing Shot of Location',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description


    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Crew With Client Or Product',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Crew Together Happy',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Wide Shot Of Set',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Gear Shot On Set',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Models Getting Ready',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Crew and Gear ',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description
  end

  def create_default_shot_list_for_video
    sli = ShotListItem.create!(shoot: self,
                          description:'Camera Movement In',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Logo focus Pull In',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Logo Gimbal Fly By',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Middle Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Middle Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Top Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Shot Wide',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Bottom Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Far Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Far Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Middle Top',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Artistic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Middle Bottom',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Dead Center',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Low To High',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Low To High',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Low To High',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Right',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Left',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Top',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'Graphic Detail',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Bottom',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Walkthrough of Set ',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Establishing Shot or Transportation',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Smiles of Crew + Talent',
                          aspect_ratio:'landscape',
                          background:"On Set Or,
                          added_by: self.company.users.first At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Thank You With Audio To Client',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Thank You With Audio To Nomadic Creative ',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Pan of Set Location',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- Thumbs Up From Primary Creator',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                          description:'BTS- with audio saying "We Love <city_name>"',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description

    sli = ShotListItem.create!(shoot: self,
                           description:'BTS- with audio saying "Thast a wrap for [Name Of Company] & Nomcre in [City Name]"',
                          aspect_ratio:'landscape',
                          background:"On Set Or At Location",
                          focus_point: 'Center',
                          added_by: self.company.users.first)
    sli.create_related_task sli.description
  end

  #class methods
  def self.create_shoots_from_template template_project_id, parent_project_id
    template_project = Project.find(template_project_id)
    project = Project.find(parent_project_id)
    template_project.shoots.each do |shoot_template|
      shoot = Shoot.new
      shoot.project = project
      shoot.company = project.company
      shoot.location_id = project.location.id
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

  def self.create_default_for_tests(project_id = 0 , company_id = 0 , location_id = 0)
    @project = Project.find(project_id)
    @shoot = Shoot.create!(project: @project, company_id: company_id, location_id: location_id, content_type: ContentType.photo, brief: @project.brief, price: DefaultPrices.photo_shoot, deadline: @project.deadline - 7.days, user_added_shot_count_max:25)
    @shoot
  end
end
