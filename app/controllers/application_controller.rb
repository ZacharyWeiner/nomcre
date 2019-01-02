class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :force_set_company
  before_action :force_set_user_type

  layout :layout_by_resource


  def home
    set_up_header

    if !current_user.nil? && current_user.user_profile.nil?
      current_user.create_user_profile!(display_name: current_user.name)
    end

    if !current_user.nil? && current_user.user_type.nil?
      if cookies[:user_type]
        current_user.user_type = cookies[:user_type]
        current_user.save
        redirect_to root_path and return
      else
        redirect_to user_type_path and return
      end
    end

    if !current_user.nil? && current_user.user_type == UserType.creative
      redirect_to creative_dashboard_path and return
    end

    if !current_user.nil? && current_user.user_type == UserType.company
      if !current_user.company.nil?
        redirect_to company_dashboard_path and return
      else
        force_set_company
      end
    end
  end

  protected
  def set_up_header
    @header_images = HeaderImage.all.where(homepage: true)
    count = @header_images.count
    random = Random.new
    index_to_use = rand(count)
    @header_image = @header_images[index_to_use]
  end

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
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :profile_image,  :password,  :current_password, :intro_complete])
  end

   private def layout_by_resource
      if devise_controller?
        'layouts/devise'
      else
        'layouts/khaki'
      end
    end
end
