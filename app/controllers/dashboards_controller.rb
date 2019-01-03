class DashboardsController < ApplicationController
  before_action :authenticate_user!
  layout 'black_dashboard'

  def company_dashboard
   if current_user.user_profile.nil?
      current_user.create_user_profile!(display_name: current_user.name)
    end
     current_user.update_intro_complete
    @complete = current_user.intro_complete
    @tasks = current_user.tasks.where(completed: nil).where(can_accept: current_user.user_type).take(10)
  end

  def creative_dashboard
    if !current_user.check_profile_complete
      return redirect_to user_profile_wizard_path(current_user.user_profile)
    end

    if !current_user.check_collection_added
      return redirect_to new_collection_path
    end

    if !current_user.check_schedule_added
      return redirect_to new_schedule_item_path
    end
  end

  def accounting_dashboard
  end

  def admin_dashboard
  end
end

