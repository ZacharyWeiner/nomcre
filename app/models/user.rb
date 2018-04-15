class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  has_and_belongs_to_many :tags
  belongs_to :company, optional: true
  has_many :proposals
  accepts_nested_attributes_for :company
  has_many :collections
  has_many :collection_items
  has_many :tasks
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :notifications
  has_many :schedule_items
  mount_uploader :profile_image, FileUploader
  has_one :user_profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  paginates_per 10

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


end
