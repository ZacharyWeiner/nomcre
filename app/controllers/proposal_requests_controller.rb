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

  def send_request_accepted_email
    @proposal_request = ProposalRequest.find(params[:id])
    ProposalMailer.request_accepted(@proposal_request).deliver_now
    redirect_to @proposal_request.proposal
  end

  def send_request_created_email
    @proposal_request = ProposalRequest.find(params[:id])
    ProposalMailer.request_created(@proposal_request).deliver_now
    redirect_to @proposal_request.proposal
  end
end

