class User < ApplicationRecord
  #belongs_to
  belongs_to :company, optional: true

  #has_one
  has_one :user_profile, dependent: :destroy

  #has_many
  has_many :proposals
  has_many :collections
  has_many :collection_items
  has_many :tasks
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :notifications
  has_many :schedule_items
  has_many :shoots, foreign_key: 'creative_id'
  has_many :projects, through: :shoots
  mount_uploader :profile_image, FileUploader
  has_many :documents
  has_many :creative_requests, foreign_key: 'creative_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validation
  validates :name, presence: true
  validates :email, uniqueness: true

  #attributes
  accepts_nested_attributes_for :company
  paginates_per 10


  #instance_methods

  def pending_requests
    self.creative_requests.where(accepted: nil).where(declined: nil)
  end

  def accepted_requests
   self.creative_requests.where(accepted: true)
  end

  def assigned_requests
    self.creative_requests.where(approved: true)
  end

  def has_request(proposal_id)
    ProposalRequest.where(requested: self.id, proposal_id: proposal_id).count > 0
  end

  def get_proposal_request(proposal_id)
    ProposalRequest.where(requested: self.id, proposal_id: proposal_id).first
  end

  def update_intro_complete
    if user_type == "company"
      check_company_intro_complete
    elsif user_type =='creative'
      check_creative_intro_complete
    end
  end

def reset_user_info
    if self.user_profile && self.user_profile.description.nil?
      self.user_profile.delete
    end
    if self.user_profile.nil?
      up = UserProfile.create!(user: self)
      self.user_profile = up
    end
    self.collections.clear
    self.schedule_items.clear
    self.intro_complete = false
    self.save
  end

  def is_admin
    admin = false
    if !self.role.nil?
      if self.role < 2
        admin = true
      end
    end
    return admin
  end

  def check_profile_complete
    (self.user_profile.display_name.nil? == false) && (self.user_profile.display_name != "") && (self.user_profile.profile_photo.file.nil? == false) && (self.user_profile.shot_preference.nil? == false)
  end

  def check_schedule_added
    self.schedule_items.count > 0
  end

  def check_collection_added
    collections_complete = (self.collections.count > 0) && (self.collections.first.collection_items.count > 0)
  end

  private
  def check_company_intro_complete
    if self.intro_complete
      return true
    end
    profile_complete = (self.user_profile.display_name.nil? == false) && (self.user_profile.display_name != "") && (self.user_profile.profile_photo.file.nil? == false)
    company_complete = (self.company.name.nil? == false) && (self.company.logo.file.nil? == false) && (self.company.website.nil? == false)
    proposal_complete = self.company.proposals.count > 0
    if profile_complete && company_complete && proposal_complete
      self.intro_complete = true
      self.save
    end
  end

  def check_creative_intro_complete
    if self.intro_complete
      return true
    end
    profile_complete = (self.user_profile.display_name.nil? == false) && (self.user_profile.display_name != "") && (self.user_profile.profile_photo.file.nil? == false)
    schedule_complete = self.schedule_items.count > 0
    collections_complete = (self.collections.count > 0) && (self.collections.first.collection_items.count > 0)

    if profile_complete && schedule_complete && collections_complete
      self.intro_complete = true
      self.save
    end
  end



  #class_methods
end
