class NotificationType
  include ActiveModel::AttributeMethods

  def self.task
    return 'Task';
  end

  def self.new_message
    return 'New Message';
  end

  def self.new_work_request
    return 'New Work Request';
  end

  def self.request_assigned
    return 'Assigned'
  end

  def self.request_accepted
    return 'Work Request Accepted';
  end

  def self.request_declined
    return 'Work Request Declined';
  end

  def self.payment_made
    return 'You Made A Payment';
  end
end
