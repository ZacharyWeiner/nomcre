class Tag < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :collections
  has_and_belongs_to_many :locations
  belongs_to :parent, :class_name => "Tag", :foreign_key => "id", optional: true
  has_many :children, :class_name => 'Tag', :foreign_key => "parent_id"
end
