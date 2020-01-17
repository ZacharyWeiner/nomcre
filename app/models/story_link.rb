class StoryLink < ApplicationRecord
  belongs_to :story
  belongs_to :external_link
end
