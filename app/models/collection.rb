class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_items, dependent: :destroy
end
