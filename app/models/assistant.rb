class Assistant < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :proposal
  has_many :documents
end
