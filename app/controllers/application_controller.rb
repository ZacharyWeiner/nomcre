class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :force_set_company
  before_action :force_set_user_type

  layout :layout_by_resource


  def home
    #check to see if the user is logged in
    if current_user
    #if logged in check if they have a user type
      if current_user.user_type.nil? == false
      #if they have a user type
        #if the user_type is company
        if current_user.user_type == 'company'
          #if there is a company associated
          if current_user.company.nil? == false
            #redirect to company dashboard
            return redirect_to company_dashboard_path
          elsif current_user.company.nil?
          #if no company associated
            force_set_company
            #force set company
          end
        elsif current_user.user_type = 'creative'
        #if the user_type is creative
          return redirect_to creative_dashboard_path
          #redirect to creative dashbaord
        end
      elsif current_user.user_type.nil?
        if cookies[:user_type]
          current_user.user_type = cookies[:user_type]
          current_user.save
          return redirect_to root_path
        end
      #if there is no user_type
        return redirect_to user_type_path
        #redirect to user_type page
      end
    end
    #if not logged in
      #show home

   # if session[:user_type]
   #    byebug
   #    current_user.user_type = session[:user_type]
   #    current_user.save
   #    session[:user_type] == nil
   #  end
   #  unless current_user.nil?
   #    if current_user.user_type == nil
   #      redirect_to user_type_path
   #    else
   #      redirect_to pages_path
   #    end
   #  end


  end

  protected
  def force_set_user_type
    if request.path.include?('sign_up')
      if session[:user_type].nil?
        return redirect_to user_type_path
      end
    end
  end
  def force_set_company
    unless current_user.nil? || request.path.include?('session') || request.path.include?("sign_out") || request.path.include?("sign_up")
      unless request.path.include?('companies')
        if (session[:user_type] == "company") || (current_user.user_type == 'company' && current_user.company.nil?)
          if current_user.user_type.nil? && session[:user_type].nil? == false
            current_user.user_type = session[:user_type]
          end
          if current_user.save
            session[:user_type] = nil
            unless current_user.nil? || current_user.user_type != 'company'
              if current_user.company.nil?
                return redirect_to new_company_path
              end
            end
          end
        end
      end
    end
  end

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :display_name, :profile_image,  :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :profile_image,  :password,  :current_password])
  end

   private def layout_by_resource
      if devise_controller?
        'layouts/devise'
      else
        'layouts/khaki'
      end
    end
end
