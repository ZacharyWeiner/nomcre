class Collection < ApplicationRecord
  #callbacks
  before_destroy :deconstruct

  #validations
  validates :title,       presence: true, case_sensitive: false
  validates :description, presence: true, case_sensitive: false

  #belongs_to
  belongs_to :user

  #has_many
  has_many :collection_items, dependent: :destroy

  #pagination
  paginates_per 10



  #instance methods
  def get_header_or_first
    header = self.collection_items.where.not(file: nil).where(is_header: true).first.file.url if (!self.collection_items.where.not(file: nil).where(is_header: true).first.nil? && !self.collection_items.where.not(file: nil).where(is_header: true).first.file.nil?)
    header = self.collection_items.where.not(file: nil).first.url if (header.nil? && !self.collection_items.where.not(file: nil).first.nil?)
    header = self.user.user_profile.safe_header_image_url if header.nil?
    header
  end

  def user_activities
    UserActivity.where(activity_type: UserActivityType.collection_added, object_id: self.id )
  end

  #class methods
  def self.get_jumbotron_url collection
    head_url =  "https://s3-us-west-2.amazonaws.com/nomcre/assets/homepage/images/horizontal/nomcre-horizontal-19.jpg"
    if collection.nil? || collection.collection_items.where.not(file: nil).first.nil?
      return head_url
    end
    has_header = !collection.collection_items.where(is_header: true).first.nil?

    #if the collection has a header Image
    head_url = collection
                .collection_items
                .where(is_header: true)
                .first
                .file
                .url if has_header

    #if the collection does NOT have a header image
    head_url = collection
               .collection_items
               .where.not(file: nil)
               .first.file.url unless has_header
    head_url
  end

  def self.create_with_activity(options = {})
    @collection = Collection.new
    @collection.user_id =     options[:user_id]

    @collection.title =       options[:title]      ?
                                                    options[:title] :
                                                    User.find(options[:user_id].name + "Did Something Awesome")

    @collection.featured =    options[:featured]   ?
                                                    options[:featured] :
                                                    nil

    @collection.description = options[:description]?
                                                    options[:description] :
                                                    nil

    @collection.featured =    options[:featured]   ?
                                                    options[:featured] :
                                                    nil

    if @collection.save!
      UserActivity.create!(activity_type: UserActivityType.collection_added, user_id: options[:user_id], object_id: @collection.id)
    end
    @collection
  end

  #deconstruct
  def deconstruct
    destroy_related_entities
  end

  def destroy_related_entities
    activities = UserActivity.where(user: self.user).where(activity_type: UserActivityType.collection_added).where( object_id: self.id)
    activities.each do |a|
      a.destroy
    end
  end
end
