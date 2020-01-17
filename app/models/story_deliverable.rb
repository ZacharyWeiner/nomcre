class StoryDeliverable < ApplicationRecord
  belongs_to :story
  belongs_to :deliverable
end
