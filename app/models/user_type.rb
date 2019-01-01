class UserType
  include ActiveModel::AttributeMethods

  def self.company
    return 'company'
  end

  def self.creative
  return 'creative'
  end

  def self.admin
    return 'admin'
  end
end
