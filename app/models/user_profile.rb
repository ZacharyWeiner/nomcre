class UserProfile < ApplicationRecord
  belongs_to :user
  mount_uploader :profile_photo, ProfileImageUploader
  mount_uploader :header_image, HeaderImageUploader


  def safe_profile_image_url
    unless self.profile_photo.url.nil?
      return self.profile_photo
    else
      return 'https://s3-us-west-2.amazonaws.com/nomcre/assets/Dummy-profile-picture.png'
    end
  end

  def safe_header_image_url
    unless self.header_image.url.nil?
      return self.header_image
    else
      return "https://s3-us-west-2.amazonaws.com/nomcre/assets/Dark-Background-6G.jpg"
    end
  end
end
