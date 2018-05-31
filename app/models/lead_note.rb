class LeadNote < ApplicationRecord
  belongs_to :lead
  paginates_per 10
end
