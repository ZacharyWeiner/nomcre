class UserProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy, :wizard]
  before_action :authorize, only: [:edit, :update, :destroy]

  #layout 'adminlte'
  layout 'black_dashboard'
  # GET /user_profiles
  # GET /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    if current_user.nil?
      redirect_to user_collection_path(@user_profile.user)
    end
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params)

    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    #TODO: Fix This
    respond_to do |format|
      unless params[:user_profile][:content_type].nil? || params[:user_profile][:content_type].count == 0
        @user_profile.content_type.clear
        params[:user_profile][:content_type].each do |type|
          @user_profile.content_type << type
        end
      end
      unless params[:user_profile][:shot_preference].nil? || params[:user_profile][:shot_preference].count == 0
        @user_profile.shot_preference.clear
        params[:user_profile][:shot_preference].each do |pref|
          @user_profile.shot_preference << pref
        end
      end
      if @user_profile.update(user_profile_params)
        activity = UserActivity.create!(activity_type: UserActivityType.updated_profile, user_id: current_user.id, object_id: current_user.id)
        if params[:redirect]
          format.html { redirect_to new_collection_path, notice: 'User profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @user_profile }
        else
          format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @user_profile }
        end
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def wizard
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      if params[:user_profile_id]
        @user_profile = UserProfile.find(params[:user_profile_id])
      else
        @user_profile = UserProfile.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:display_name, :description, :shot_preference, :content_type, :profile_photo, :header_image, :is_featured, :premium, :paypal_or_venmo, :account_name)
    end

    def authorize
      if current_user.is_admin || current_user.user_profile == @user_profile
        return
      end
      return redirect_to root_path
    end
end
