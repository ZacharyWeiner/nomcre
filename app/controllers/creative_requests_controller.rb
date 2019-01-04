class CreativeRequestsController < ApplicationController
  before_action :set_creative_request, only: [:show, :edit, :update, :destroy, :accept, :decline]
  before_action :authenticate_user!
  layout 'black_dashboard'

  # GET /creative_requests
  # GET /creative_requests.json
  def index
    #if the current user is a company, show all the creative requests for the company
    if current_user.user_type == UserType.company
      @creative_requests = CreativeRequest.where(company: current_user.company)
    elsif
      #if the current user is a  creative show all the requests for the user
      @creative_requests = CreativeRequest.where(creative: current_user)
    else
      @creative_requests = CreativeRequest.all
    end
    @creative_requests.reverse
  end

  # GET /creative_requests/1
  # GET /creative_requests/1.json
  def show
  end

  # GET /creative_requests/new
  def new
    @creative_request = CreativeRequest.new
  end

  # GET /creative_requests/1/edit
  def edit
  end

  # POST /creative_requests
  # POST /creative_requests.json
  def create
    @creative_request = CreativeRequest.new(creative_request_params)

    respond_to do |format|
      if @creative_request.save
        format.html { redirect_to @creative_request, notice: 'Creative request was successfully created.' }
        format.json { render :show, status: :created, location: @creative_request }
      else
        format.html { render :new }
        format.json { render json: @creative_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creative_requests/1
  # PATCH/PUT /creative_requests/1.json
  def update
    respond_to do |format|
      if @creative_request.update(creative_request_params)
        format.html { redirect_to @creative_request, notice: 'Creative request was successfully updated.' }
        format.json { render :show, status: :ok, location: @creative_request }
      else
        format.html { render :edit }
        format.json { render json: @creative_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creative_requests/1
  # DELETE /creative_requests/1.json
  def destroy
    @creative_request.destroy
    respond_to do |format|
      format.html { redirect_to creative_requests_url, notice: 'Creative request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    @creative_request.accept
    success = @creative_request.accept
    phrase_for_notify = success == true ? 'successfully' : 'could not be'
    respond_to do |format|
      format.html { redirect_to creative_requests_path, notice: "Creative request was #{phrase_for_notify} Accepted." }
      format.json { head :no_content }
    end
  end

  def decline
    @creative_request.decline
    success = @creative_request.decline
    phrase_for_notify = success == true ? 'successfully' : 'could not be'
    respond_to do |format|
      format.html { redirect_to creative_requests_path, notice: "Creative request was #{phrase_for_notify} declined." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative_request
      if params[:creative_request_id]
        @creative_request = CreativeRequest.find(params[:creative_request_id])
      else
        @creative_request = CreativeRequest.find(params[:id])
      end
    end

    def authorize
      if current_user.user_type == UserType.company
        if @creative_request.company != current_user.company
          p "User #{current_user.email} is not Authorized to Accept or decline CreativeRequest #{@creative_request.id}"
          redirect_to creative_requests_path
        end
      elsif current_user.user_type == UserType.creative
        if @creative_request.creative != current_user
          p "User #{current_user.email} is not Authorized to Accept or decline CreativeRequest #{@creative_request.id}"
          redirect_to creative_requests_path
        end
      else
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creative_request_params
      params.require(:creative_request).permit(:shoot_id, :requested_by_id, :creative_id, :company_id, :accepted, :accepted_on, :deadline, :approved, :declined)
    end
end
