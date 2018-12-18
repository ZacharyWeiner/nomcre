class CreativeRequestsController < ApplicationController
  before_action :set_creative_request, only: [:show, :edit, :update, :destroy]

  # GET /creative_requests
  # GET /creative_requests.json
  def index
    @creative_requests = CreativeRequest.all
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative_request
      @creative_request = CreativeRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creative_request_params
      params.require(:creative_request).permit(:shoot_id, :requested_by_id, :creative_id, :company_id, :accepted, :accepted_on, :deadline, :approved, :declined)
    end
end
