class ScheduleItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule_item, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :new, :show, :create]
  layout 'black_dashboard'
  # GET /schedule_items
  # GET /schedule_items.json
  def index
    @schedule_items = ScheduleItem.where(user: current_user).order(:start_date)
  end

  # GET /schedule_items/1
  # GET /schedule_items/1.json
  def show
  end

  # GET /schedule_items/new
  def new
    @schedule_item = ScheduleItem.new
  end

  # GET /schedule_items/1/edit
  def edit
  end

  # POST /schedule_items
  # POST /schedule_items.json
  def create
    #TODO: Move to ScheduleItem.create_with_activity
    @schedule_item = ScheduleItem.new(schedule_item_params)
    @schedule_item.user = current_user
    if schedule_item_params[:start_date]
      @schedule_item.start_date = parse_date(schedule_item_params[:start_date])
    end
    if schedule_item_params[:end_date]
      @schedule_item.end_date = parse_date(schedule_item_params[:end_date])
    end
    respond_to do |format|
      if @schedule_item.save
        UserActivity.create!(activity_type: UserActivityType.travel_plan_created, user_id: current_user.id, object_id: @schedule_item.id)
        format.html { redirect_to schedule_items_path, notice: 'Schedule item was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_item }
      else
        format.html { render :new }
        format.json { render json: @schedule_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_items/1
  # PATCH/PUT /schedule_items/1.json
  def update
    respond_to do |format|
      if @schedule_item.update(schedule_item_params)
        format.html { redirect_to @schedule_item, notice: 'Schedule item was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_item }
      else
        format.html { render :edit }
        format.json { render json: @schedule_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_items/1
  # DELETE /schedule_items/1.json
  def destroy
    @schedule_item.destroy
    respond_to do |format|
      format.html { redirect_to admin_schedule_items_path, notice: 'Schedule item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_item
      @schedule_item = ScheduleItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_item_params
      params.require(:schedule_item).permit(:start_date, :end_date, :location_id, :user_id, :notes)
    end

    def authorize
      if current_user.is_admin
        return
      elsif  (@schedule_item.user != current_user)
        redirect_to root_path
      end
    end

    def parse_date params_string
      DateHelper.parse_date params_string
    end
end
