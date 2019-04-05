class UserProfile < ApplicationRecord
  #validations
  validates :display_name, presence: true
  validates :profile_photo,  file_size: { less_than_or_equal_to: 15.megabytes }

  #belongs_to
  belongs_to :user

  #uploaders
  mount_uploader :profile_photo, ProfileImageUploader
  mount_uploader :header_image, HeaderImageUploader

  #Instance methods
  def safe_profile_image_url
    unless self.profile_photo.url.nil? || self.profile_photo.file.nil?
      return self.profile_photo
    else
      return UserProfile.default_profile_image
    end
  end

  def safe_header_image_url
    unless self.header_image.url.nil?
      return self.header_image.url
    else
      return UserProfile.default_header_image
    end
  end

  def activities
    UserActivity.where(user_id: self.user.id)
  end


  #Class Methods
  def self.default_profile_image
    return 'https://s3-us-west-2.amazonaws.com/nomcre/assets/Dummy-profile-picture.png'
  end

  def self.default_header_image
    return "https://s3-us-west-2.amazonaws.com/nomcre/assets/Dark-Background-6G.jpg"
  end
end
