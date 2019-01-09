class ShootStyle
  include ActiveModel::AttributeMethods

  def self.product
    return 'Product'
  end

  def self.lifestyle
    return 'Lifestyle'
  end

  def self.action
    return 'Action'
  end

  def self.mixed
    return 'Mixed'
  end
end

