class UserProfile < ApplicationRecord
  belongs_to :user
  mount_uploader :profile_photo, ProfileImageUploader
  mount_uploader :header_image, HeaderImageUploader


  def safe_profile_image_url
    unless self.profile_photo.url.nil?
      return self.profile_photo
    else
      return UserProfile.default_profile_image
    end
  end

  def safe_header_image_url
    unless self.header_image.url.nil?
      return self.header_image
    else
      return UserProfile.default_header_image
    end
  end

  def activities
    UserActivity.where(user_id: self.user.id)
  end


  def self.default_profile_image
    return 'https://s3-us-west-2.amazonaws.com/nomcre/assets/Dummy-profile-picture.png'
  end

  def self.default_header_image
    return "https://s3-us-west-2.amazonaws.com/nomcre/assets/Dark-Background-6G.jpg"
  end
end
