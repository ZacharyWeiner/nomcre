class Lead < ApplicationRecord
  has_many :lead_notes
  paginates_per 10


end
