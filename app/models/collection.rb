class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_items, dependent: :destroy
  before_destroy :destroy_related_entities


  def destroy_related_entities
    activities = UserActivity.where(user: self.user).where(activity_type: UserActivityType.collection_added).where( object_id: self.id)
    activities.each do |a|
      a.destroy
    end
  end
end
