class AdminController < ApplicationController
  layout 'adminlte'
  def users
    @users = User.all.page params[:page]

  end

  def proposals
    @proposals = Proposal.all.page params[:page]
  end
end
