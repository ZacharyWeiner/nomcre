class ShootsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shoot, only: [:show, :edit, :update, :destroy, :create_creative_request, :assign_from_request]
  before_action :authorize, only: [:edit, :update, :destroy, :assign_from_request]
  before_action :authorize_show, only: [:show]
  layout 'black_dashboard'

  # GET /shoots
  # GET /shoots.json
  def index
    if current_user.user_type == UserType.company
      if params[:active] == 'complete'
        @shoots = Shoot.where({company: current_user.company, is_complete: true})
      else
        @shoots = Shoot.where(company: current_user.company)
      end
    elsif current_user.user_type == UserType.creative
      if params[:active] == 'complete'
        @shoots = Shoot.where({creative: current_user, is_complete: true})
      else
        @shoots = Shoot.where(creative: current_user)
      end
    end
  end

  # GET /shoots/1
  # GET /shoots/1.json
  def show
    Notification.check_notifications(current_user.id, NotificationType.new_work_request, @shoot.id)
    Notification.check_notifications(current_user.id, NotificationType.request_assigned, @shoot.id)
    Notification.check_notifications(current_user.id, NotificationType.request_accepted, @shoot.id)
    Notification.check_notifications(current_user.id, NotificationType.request_declined, @shoot.id)
  end

  # GET /shoots/new
  def new
    @shoot = Shoot.new
    @shoot.set_location_rental = false
    if params[:project_id]
      @project = Project.find(params[:project_id])
    end
  end

  # GET /shoots/1/edit
  def edit
    if !@shoot.is_editable
      respond_to do |format|
         format.html { redirect_to @shoot, notice: 'Shoot can not be edited after a creative is asssigned' }
      end
    end
    @project = @shoot.project
  end

  # POST /shoots
  # POST /shoots.json
  def create
    @shoot = Shoot.new(shoot_params)
    @project = Project.find(shoot_params[:project_id])
    @shoot.user_saved = true
    @shoot.company = current_user.company
    @shoot.price = @shoot.content_type == ContentType.photo ? DefaultPrices.photo_shoot : DefaultPrices.video_shoot
    @shoot.deadline = @project.deadline
    respond_to do |format|
      if @shoot.save
        if @shoot.project.require_update_locations
          @shoot.project.update_project_shoot_locations @shoot.location.id
        end
        @project.update_price(@project.price + @shoot.price)
        format.html { redirect_to @shoot, notice: 'Shoot was successfully created.' }
        format.json { render :show, status: :created, location: @shoot }
      else
        format.html { redirect_to new_project_shoot_path(shoot_params[:project_id])  }
        format.json { render json: @shoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoots/1
  # PATCH/PUT /shoots/1.json
  def update
    #TODO: Move FP update to helper
    attributes = shoot_params.clone
    attributes[:user_saved] = true
    unless shoot_params[:focus_points].nil? || shoot_params[:focus_points].count == 0
      if !@shoot.focus_points.nil?
        @shoot.focus_points.clear
      else
        @shoot.focus_points = ['']
      end
      points = []
      attributes[:focus_points].each do |fp|
        if fp == "0"
        else
          if points.length < 3
            points << fp
          end
        end
      end
      attributes[:focus_points] = points
    end
    respond_to do |format|
      if @shoot.update(attributes)
        if @shoot.project.require_update_shoot_locations
          @shoot.project.update_project_shoot_locations @shoot.location.id
        end
        format.html { redirect_to @shoot, notice: 'Shoot was successfully updated.' }
        format.json { render :show, status: :ok, location: @shoot }
      else
        format.html { render :edit }
        format.json { render json: @shoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoots/1
  # DELETE /shoots/1.json
  def destroy
    @shoot.destroy
    respond_to do |format|
      format.html { redirect_to shoots_url, notice: 'Shoot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_creative_request
    creative = User.find(params[:user_id])
    creative_request = CreativeRequest.create_for_shoot(creative_id: creative.id, shoot_id: @shoot.id)
    respond_to do |format|
      format.html { redirect_to shoot_path(@shoot, :active => 'available'), notice: "Request to #{creative.user_profile.display_name} was successfully sent." }
      format.json { head :no_content }
    end
  end

  def request_all_available_creatives
    set_shoot
    creatives_list = @shoot.find_creatives
    creatives_list.each do |sr|
      creative_request = CreativeRequest.create_for_shoot(creative_id: sr.user_id, shoot_id: @shoot.id)
    end
    respond_to do |format|
      format.html { redirect_to shoot_path(@shoot, :active => 'available'), notice: "A Request has been sent to all available creatives" }
      format.json { head :no_content }
    end
  end

  def assign_from_request
    request = CreativeRequest.find(params[:creative_request_id])
    assigned = request.shoot.assign_from_request(request.id)
    respond_to do |format|
      if assigned
        format.html { redirect_to shoot_path(@shoot), notice: "#{request.creative.user_profile.display_name} has been assigned to #{request.shoot.project.title}" }
        format.json { head :no_content }
      else
        format.html { redirect_to shoot_path(@shoot), notice: "#{request.creative.user_profile.display_name} could not be assigned to #{request.shoot.project.title}" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoot
      if params[:shoot_id]
        @shoot = Shoot.find(params[:shoot_id])
      else
        @shoot = Shoot.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoot_params
      params.require(:shoot).permit(:creative_id,
                                    :project_id,
                                    :company_id,
                                    :location_id,
                                    :deadline,
                                    :title,
                                    :content_type,
                                    :brief,
                                    :time_of_day,
                                    :bts,
                                    :price,
                                    :background,
                                    :background_note,
                                    :deadline,
                                    :shoot_style,
                                    :shoot_raw,
                                    :user_added_shot_count,
                                    :user_added_shot_count_max,
                                    :user_saved,
                                    :shoot_date,
                                    :call_time,
                                    :set_location_rental,
                                    :rental_price,
                                    :transportation_required,
                                    :address_or_landmark,
                                    :set_contact_name,
                                    :set_contact_phone,
                                    :parking_details,
                                    :rental_details,
                                    :other_details,
                                    focus_points: [])
    end

    def authorize
      #TODO: Move To Helper
      if current_user.is_admin
        return
      end
      if (current_user.company.nil? || current_user.company != @shoot.company)
        redirect_to shoots_path
      end
    end

    def authorize_show
      if current_user.is_admin || current_user.company == @shoot.company
        return
      end
      if @shoot.creative.nil? || @shoot.creative == current_user
        return
      else
        Notification.check_notifications(current_user.id, NotificationType.new_work_request, @shoot.id)
        Notification.check_notifications(current_user.id, NotificationType.request_assigned, @shoot.id)
        Notification.check_notifications(current_user.id, NotificationType.request_accepted, @shoot.id)
        Notification.check_notifications(current_user.id, NotificationType.request_declined, @shoot.id)

        flash[:warning] = 'We must apologize, someone else has been assigned to the shoot.'
        redirect_to shoots_path
      end
    end
end
