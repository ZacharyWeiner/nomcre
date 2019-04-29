class AdminController < ApplicationController
  before_action :is_admin
  layout 'black_dashboard'
  def task_groups
    @task_groups = TaskGroup.where(is_template: true)
  end

  def edit_task_group
    @task_group = TaskGroup.find(params[:id])
  end

  def users
    @users = User.all.page params[:page]
  end

  def proposals
    @proposals = Proposal.all.page params[:page]
  end

  def projects
    @projects = Project.where.not({is_template: true, is_default_template: true}).page params[:page]
  end

  def new_project
    @project = Project.new
  end

  def edit_project
    @project = Project.find(params[:project_id])
  end

  def edit_project_price
    @project = Project.find(params[:project_id])
  end

  def shoots
    @shoots = Shoot.all.page params[:page]
  end

  def edit_shoot
    @shoot = Shoot.find(params[:shoot_id])
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
    @leads = Lead.all
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

  def black_dashboard
    render layout: "black_dashboard"
  end

  private
  def set_proposal
     if params[:proposal_id]
      @proposal = Proposal.find(params[:proposal_id])
    end
  end

end
