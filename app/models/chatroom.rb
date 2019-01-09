class Chatroom < ApplicationRecord
  #validations
  validates   :topic,     presence: true, case_sensitive: false

  #beloings_to
  belongs_to  :shoot
  belongs_to  :proposal,  optional: true

  #has_many
  has_many    :messages,  dependent: :destroy
  has_many    :users,     through: :messages

  paginates_per 10
end

