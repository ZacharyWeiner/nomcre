class UserActivity < ApplicationRecord
  #validations
  validates :activity_type, presence: true
  validates :object_id, presence: true

  #belongs_to
  belongs_to :user
end
