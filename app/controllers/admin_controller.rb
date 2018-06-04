class AdminController < ApplicationController
  before_action :is_admin
  layout 'adminlte'
  def users
    @users = User.all.page params[:page]

  end

  def proposals
    @proposals = Proposal.all.page params[:page]
  end

  def schedule_items
    @schedule_items = ScheduleItem.all.page params[:page]
  end

  def collections
    @collections = Collection.all.page params[:page]
  end

  def is_admin
    if current_user.nil? || current_user.role.nil? == true
      redirect_to root_path
    end
  end

  def chatrooms
    @chatrooms = Chatroom.all.page params[:page]
  end

  def leads
    @leads = Lead.all.page params[:page]
  end

  def proposal_price
    set_proposal
  end

  def proposal_mark_deposit_paid
    set_proposal
    @proposal.deposit_paid = true
    @proposal.deposit_paid_on = Date.today
    @proposal.save!
    redirect_to admin_proposals_path
  end

  def proposal_mark_balance_paid
    set_proposal
    @proposal.paid = true
    @proposal.balance_paid_on = Date.today
    @proposal.save!
    redirect_to admin_proposals_path
  end

  private
  def set_proposal
     if params[:proposal_id]
      @proposal = Proposal.find(params[:proposal_id])
    end
  end

end
