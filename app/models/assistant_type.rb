class AssistantType
  include ActiveModel::AttributeMethods

  def self.general
    return 'General'
  end

  def self.hmu
    return 'HMU'
  end

  def self.model
    return 'Model'
  end
end
