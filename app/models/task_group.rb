class TaskGroup < ApplicationRecord
  before_destroy :orphan_relations

  belongs_to :shoot
  has_one :company, through: :shoot
  belongs_to :approver, :class_name => 'User', :foreign_key => 'approver_id', optional: true
  has_many :tasks
  has_many :shot_list_items

  def orphan_relations
    self.tasks.each do |t|
      t.destroy
    end
    self.shot_list_items.each do |sli|
      sli.destroy
    end
  end
end
