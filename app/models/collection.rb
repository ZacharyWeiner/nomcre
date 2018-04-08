class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_items, dependent: :destroy
  before_destroy :destroy_related_entities
  paginates_per 10

  def destroy_related_entities
    activities = UserActivity.where(user: self.user).where(activity_type: UserActivityType.collection_added).where( object_id: self.id)
    activities.each do |a|
      a.destroy
    end
  end

  def self.get_jumbotron_url collection
    head_url =  "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg"
    #if there are no items in the collection
    if collection.nil?
      #if the collection is nil keep the default image
    elsif collection.collection_items.count == 0
      #If the collection has no items check to see if the user has a header image before assigning default image
      if collection.user != nil && collection.user.user_profile != nil && collection.user.user_profile.header_image.nil? == false
        header_url = collection.user.user_profile.header_image.url
      else
        #use default
      end
    else
      #if there are items in the collection
      # look for the one marked as the header
      collection_item = collection.collection_items.where(is_header: true).first
      #if there is one marked header -->
      if collection_item
        head_url = collection_item.file.url
      else
        #if there none are marked header check for an image
        collection_item =  collection.collection_items.where.not(file: nil).first
        if collection_item
          head_url = collection_item.file.url
        end
      end
    end
    head_url
  end

  def get_header_or_first
    header = self.collection_items.where(is_header: true).first
    if header.nil?
      header = self.collection_items.where.not(file: nil).first
    end
    if header.nil?
      header = self.user.safe_header_image_url
    end
    header
  end
end
