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

  def is_admin
    if current_user.nil? || current_user.role != 0
      redirect_to root_path
    end
  end
end