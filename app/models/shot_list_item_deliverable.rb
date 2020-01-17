class ShotListItemDeliverable < ApplicationRecord
  belongs_to :shot_list_item
  belongs_to :deliverable
end
