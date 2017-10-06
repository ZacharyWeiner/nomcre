class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  belongs_to :company, optional: true
  accepts_nested_attributes_for :company
  has_many :collections
  has_many :collection_items
  has_many :tasks
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :notifications
  mount_uploader :profile_image, FileUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def has_request(proposal_id)
    ProposalRequest.where(requested: self.id, proposal_id: proposal_id).count > 0
  end

  def get_proposal_request(proposal_id)
    ProposalRequest.where(requested: self.id, proposal_id: proposal_id).first
  end
end
