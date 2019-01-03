class DefaultPrices
  include ActiveModel::AttributeMethods

  def self.photo_shoot
    return 5000
  end

  def self.video_shoot
    return 10000
  end
end

