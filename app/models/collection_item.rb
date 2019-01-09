require 'file_size_validator'
class CollectionItem < ApplicationRecord
  #callbacks
  before_destroy :destroy_related_entities

  #validation
  validates :file, file_size: { less_than_or_equal_to: 15.megabytes }
  validates :video, file_size: { less_than_or_equal_to: 50.megabytes }
  validates :item_type, presence: true
  validates :is_header, inclusion: { in: [ true, false ] }

  #belongs_to
  belongs_to      :user
  belongs_to      :collection

  #uploaders
  mount_uploader :file, FileUploader
  mount_uploader :video, VideoUploader

  def self.create_with_activity(options = {})
    @collection_item = CollectionItem.new
    @collection_item.user_id =        options[:user_id] ? options[:user_id] : nil
    @collection_item.collection_id =  options[:collection_id] ? options[:collection_id] : nil
    @collection_item.file =           options[:file] ? options[:file] : nil
    @collection_item.video =          options[:video] ? options[:video] : nil
    @collection_item.item_type =      options[:item_type] ? options[:item_type] : nil
    @collection_item.order =          options[:order] ? options[:order] : Collection.find(options[:collection_id]).collection_items.count
    @collection_item.is_header =      options[:is_header] ? options[:is_header] : false

    if @collection_item.save!
      activity_type = !@collection_item.file.nil? ? UserActivityType.collection_photo_added : UserActivityType.collection_video_added
      @user_activity = UserActivity.create(activity_type: activity_type, user_id: options[:user_id], object_id: @collection_item.id)
    end
    @collection_item
  end


  def destroy_related_entities
    activities = UserActivity.where(user: self.user).where(activity_type: UserActivityType.collection_photo_added).where(object_id: self.id)
     activities.each do |a|
      a.destroy
    end
  end
end
