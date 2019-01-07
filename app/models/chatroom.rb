class Chatroom < ApplicationRecord
  belongs_to :shoot
  belongs_to :proposal, optional: true
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :topic, presence: true, case_sensitive: false
  paginates_per 10
end

