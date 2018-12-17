class Shoot < ApplicationRecord
  #belongs_to
  belongs_to :project
  belongs_to :company
  belongs_to :location
  belongs_to :creative, foreign_key: 'creative_id', class_name: 'User', optional: true

  #has_one
  has_one :chatroom

  #has_many
  has_many :documents
  has_many :assistants
  has_many :tasks
  has_many :shot_list_items


  #instance_methods
  def owner_added_shot_list_count
    company_ids = self.project.owners.map{|u| u.id}
    self.shot_list_items.where(added_by: company_ids).count
  end
  #class methods
end
