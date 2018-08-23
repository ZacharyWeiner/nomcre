class Assistant < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :proposal
end
