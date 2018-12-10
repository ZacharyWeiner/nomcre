class AssistantsController < ApplicationController
  before_action :set_assistant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize, except: [:create]
  layout 'black_dashboard'
  # GET /assistants
  # GET /assistants.json
  def index
    if params[:proposal_id]
      @assistants = Assistant.where(proposal_id: params[:proposal_id])
    else
      @assistants = Assistant.all
    end
  end

  # GET /assistants/1
  # GET /assistants/1.json
  def show
  end

  # GET /assistants/new
  def new
    @assistant = Assistant.new
  end

  # GET /assistants/1/edit
  def edit
  end

  # POST /assistants
  # POST /assistants.json
  def create
    @assistant = Assistant.new(assistant_params)
    respond_to do |format|
      if @assistant.save
        if @assistant.proposal != nil
          format.html { redirect_to proposal_path(@assistant.proposal, :active => 'assistants'), notice: 'Assistant was successfully created.' }
          format.json { render :show, status: :created, location: @assistant }
        else
          format.html { redirect_to @assistant, notice: 'Assistant was successfully created.' }
          format.json { render :show, status: :created, location: @assistant }
        end
      else
        format.html { render :new }
        format.json { render json: @assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assistants/1
  # PATCH/PUT /assistants/1.json
  def update
    respond_to do |format|
      if @assistant.update(assistant_params)
       if @assistant.proposal != nil
          format.html { redirect_to proposal_path(@assistant.proposal, :active => 'assistants'), notice: 'Assistant was successfully updated.' }
          format.json { render :show, status: :created, location: @assistant }
        else
          format.html { redirect_to @assistant, notice: 'Assistant was successfully updated.' }
          format.json { render :show, status: :created, location: @assistant }
        end
      else
        format.html { render :edit }
        format.json { render json: @assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assistants/1
  # DELETE /assistants/1.json
  def destroy
    @assistant.destroy
    respond_to do |format|
      format.html { redirect_to assistants_url, notice: 'Assistant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assistant
      @assistant = Assistant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assistant_params
      params.require(:assistant).permit(:name, :paypal_email, :phone, :rate, :assistant_type, :location_id, :proposal_id, :facebook, :instagram, :notes)
    end

    def authorize
      allow = false
      if current_user
        if params[:proposal_id] || (params[:assistants] && params[:assistant][:proposal_id])
          proposal = params[:proposal_id] != nil ?
            Proposal.find(params[:proposal_id]) : Proposal.find(params[:assistant][:proposal_id])
          if current_user == proposal.user || current_user.company == proposal.company
            allow = true
          end
        end
        if current_user.role == 0
          allow = true
        end
      end
      if !allow
        redirect_to root_path
      end
    end
end
