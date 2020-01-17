class Story < ApplicationRecord
  belongs_to :project, :optional => true
  belongs_to :company, :optional => true
  has_many :users, through: :company
  has_many :story_links
  has_many :external_links, through: :story_links
  has_many :story_videos
  has_many :videos, through: :story_videos
  has_many :story_scenes
  has_many :scenes, through: :story_scenes
  has_many :story_deliverables
  has_many :deliverables, through: :story_deliverables
end
