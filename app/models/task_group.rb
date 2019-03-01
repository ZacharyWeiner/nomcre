class TaskGroup < ApplicationRecord
  before_destroy :orphan_relations

  belongs_to :parent, class_name: 'TaskGroup', foreign_key: 'parent_id', optional: true
  belongs_to :shoot, optional: true
  belongs_to :approver, :class_name => 'User', :foreign_key => 'approver_id', optional: true

  has_many :tasks
  has_many :shot_list_items
  has_many :shot_list_item_templates
  has_many :children, class_name: 'TaskGroup', foreign_key: 'parent_id'

  has_one :company, through: :shoot

  def orphan_relations
    self.tasks.each do |t|
      t.destroy
    end
    self.shot_list_items.each do |sli|
      sli.destroy
    end
    self.shot_list_item_templates.each do |sli|
      sli.destroy
    end
  end
end
