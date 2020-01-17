class Deliverable < ApplicationRecord
  belongs_to :deliverable_type
  has_many :project_deliverables
  has_many :projects, through: :project_deliverables
  has_many :scene_deliverables
  has_many :scenes, through: :scene_deliverables
  has_many :shoot_deliverables
  has_many :shoots, through: :shoot_deliverables
  has_many :shot_list_item_deliverables
  has_many :shot_list_items, through: :shot_list_item_deliverables
  has_many :story_deliverables
  has_many :stories, through: :story_deliverables
end
