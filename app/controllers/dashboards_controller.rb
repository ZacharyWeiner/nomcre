class DashboardsController < ApplicationController
  layout 'adminlte'
  def company_dashboard
   if current_user.user_profile.nil?
      current_user.create_user_profile!(display_name: current_user.name)
    end
     current_user.update_intro_complete
    @complete = current_user.intro_complete
  end

  def creative_dashboard
    current_user.update_intro_complete
    @complete = current_user.intro_complete
  end

  def accounting_dashboard
  end

  def admin_dashboard
  end
end

