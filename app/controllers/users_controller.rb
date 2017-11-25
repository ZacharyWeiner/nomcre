class UsersController < ApplicationController
  layout :set_layout
  def show
    set_user
  end

  def user_type

  end

  def set_user_type
    if current_user.nil?
      session[:user_type] = params[:user_type]
      cookies[:user_type] = params[:user_type]
      return redirect_to new_user_registration_path
    else
      current_user.user_type = params[:user_type]
      current_user.save
      redirect_to root_path
    end
  end

  protected
  def set_user
    if params[:id]
      @user = User.find(params[:id])
    end
  end

  def set_layout
    if current_user.nil? || current_user.user_type.nil?
      return 'khaki'
    else
      return 'adminlte'
    end
  end
end
