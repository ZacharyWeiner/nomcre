class ContentType
  include ActiveModel::AttributeMethods

  def self.photo
    return 'photo'
  end

  def self.video
    return 'video'
  end
end
