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
    if current_user.nil? || current_user.role != 0
      redirect_to root_path
    end
  end

  def chatrooms
    @chatrooms = Chatroom.all.page params[:page]
  end

  def proposal_price
    if params[:proposal_id]
      @proposal = Proposal.find(params[:proposal_id])
    end
  end
end
