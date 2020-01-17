class ProjectDeliverable < ApplicationRecord
  belongs_to :project
  belongs_to :deliverable
end
