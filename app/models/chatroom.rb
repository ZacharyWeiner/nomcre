class Chatroom < ApplicationRecord
  belongs_to :shoot, optional: true
  belongs_to :proposal
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :topic, presence: true, case_sensitive: false
  paginates_per 10
end
