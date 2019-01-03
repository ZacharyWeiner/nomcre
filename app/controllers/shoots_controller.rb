class ShootsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shoot, only: [:show, :edit, :update, :destroy, :create_creative_request, :assign_from_request]
  before_action :authorize, only: [:edit, :update, :destroy, :assign_from_request]
  layout 'black_dashboard'

  # GET /shoots
  # GET /shoots.json
  def index
    if current_user.user_type == UserType.company
      @shoots = Shoot.where(company: current_user.company)
    elsif current_user.user_type == UserType.creative
      @shoots = Shoot.where(creative: current_user)
    end
  end

  # GET /shoots/1
  # GET /shoots/1.json
  def show
    Notification.check_notifications(current_user.id, NotificationType.new_work_request, object_id: @shoot.id)
  end

  # GET /shoots/new
  def new
    @shoot = Shoot.new
  end

  # GET /shoots/1/edit
  def edit
  end

  # POST /shoots
  # POST /shoots.json
  def create
    @shoot = Shoot.new(shoot_params)
    @shoot.user_saved = true
    respond_to do |format|
      if @shoot.save
        format.html { redirect_to @shoot, notice: 'Shoot was successfully created.' }
        format.json { render :show, status: :created, location: @shoot }
      else
        format.html { render :new }
        format.json { render json: @shoot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoots/1
  # PATCH/PUT /shoots/1.json
  def update
    attributes = shoot_params.clone
    attributes[:user_saved] = true
    respond_to do |format|
      if @shoot.update(attributes)
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
      byebug
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
      params.require(:shoot).permit(:creative_id, :project_id, :company_id, :location_id, :content_type, :brief, :time_of_day, :bts, :focus_points, :price, :background, :background_note, :shoot_style, :shoot_raw, :user_added_shot_count, :user_added_shot_count_max, :user_saved)
    end

    def authorize
      if current_user.is_admin
        return
      end
      if (current_user.company.nil? || current_user.company != @shoot.company)
        redirect_to shoots_path
      end
    end
end
