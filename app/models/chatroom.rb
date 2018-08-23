class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  belongs_to :proposal
  validates :topic, presence: true, case_sensitive: false
  paginates_per 10
end
