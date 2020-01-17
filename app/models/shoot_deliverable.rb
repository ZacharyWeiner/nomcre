class ShootDeliverable < ApplicationRecord
  belongs_to :shoot
  belongs_to :deliverable
end
