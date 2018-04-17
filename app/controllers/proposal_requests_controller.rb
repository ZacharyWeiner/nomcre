class ProposalRequestsController < ApplicationController
  layout 'adminlte'
  before_action :authenticate_user!

  def requests
     if current_user.user_type == 'creative'
      @requests = ProposalRequest.where(requested: current_user.id).where(approved: nil)
     elsif current_user.user_type == 'company'
      @requests = ProposalRequest.where(requested_by: current_user.id).where(approved: nil)
     end

    @notifications = Notification.where(user_id: current_user.id).where(notification_type: "New Request").where(read: false)
    @notifications.each do |note|
      note.read = true
      note.save
    end
  end

  def decline
    set_proposal_request
    @proposal_request.accepted = false
    @proposal_request.save
    redirect_to proposal_requests_path
  end

  def send_request_accepted_email
    set_proposal_request
    ProposalMailer.request_accepted(@proposal_request).deliver_now
    redirect_to @proposal_request.proposal
  end

  def send_request_created_email
    set_proposal_request
    ProposalMailer.request_created(@proposal_request).deliver_now
    redirect_to @proposal_request.proposal
  end


  private
  def set_proposal_request
    @proposal_request = ProposalRequest.find(params[:id])
  end
end

