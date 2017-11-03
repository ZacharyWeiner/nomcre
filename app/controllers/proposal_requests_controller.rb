class ProposalRequestsController < ApplicationController
  layout 'adminlte'
  def requests
     if current_user.user_type == 'creative'
      @requests = ProposalRequest.where(requested: current_user.id).where(accepted: nil)
    end

    @notifications = Notification.where(user_id: current_user.id).where(notification_type: "New Request").where(read: false)
    @notifications.each do |note|
      note.read = true
      note.save
    end
  end
end

