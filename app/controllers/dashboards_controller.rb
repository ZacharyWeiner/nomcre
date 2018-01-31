class DashboardsController < ApplicationController
  layout 'adminlte'
  def company_dashboard
  end

  def creative_dashboard
    current_user.update_intro_complete
    @complete = current_user.intro_complete
  end

  def accounting_dashboard
  end
end

