class Scene < ApplicationRecord
  has_many :story_scenes
  has_many :stories, through: :story_scenes
  has_many :scene_deliverables
  has_many :deliverables, through: :scene_deliverables
end
