class StoryVideo < ApplicationRecord
  belongs_to :story
  belongs_to :video
end
