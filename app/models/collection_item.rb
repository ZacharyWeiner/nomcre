require 'file_size_validator'
class CollectionItem < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  mount_uploader :file, FileUploader
  mount_uploader :video, VideoUploader
  validates :file, file_size: { less_than_or_equal_to: 15.megabytes }
  validates :video, file_size: { less_than_or_equal_to: 50.megabytes }
  before_destroy :destroy_related_entities

  def destroy_related_entities
    activities = UserActivity.where(user: self.user).where(activity_type: UserActivityType.collection_photo_added).where(object_id: self.id)
     activities.each do |a|
      a.destroy
    end
  end
end
