class TaskGroup < ApplicationRecord
  belongs_to :shoot
  has_one :company, through: :shoot
  belongs_to :approver, :class_name => 'User', :foreign_key => 'approver_id', optional: true
  has_many :tasks
  has_many :shot_list_items
end
