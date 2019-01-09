class UserActivityType
  include ActiveModel::AttributeMethods

  def self.collection_added
    return 'Added A Collection'
  end

  def self.collection_photo_added
    return 'Added A Photo To Collection'
  end

  def self.collection_video_added
    return 'Added A Video To Collection'
  end

  def self.proposal_request
    return 'Sent A Proposal Request'
  end

  def self.shoot_request
    return 'Recieved A New Shoot Request'
  end

  def self.proposal_accepted
    return 'Accepted A Job'
  end

  def self.proposal_created
    return "Created A Proposal"
  end

  def self.travel_plan_created
    return "Updated Their Schedule"
  end

  def self.updated_profile
    return "Updated Their Profile"
  end
end
