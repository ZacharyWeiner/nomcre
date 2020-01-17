class ExternalLink < ApplicationRecord
  has_and_belongs_to_many :stories
end
