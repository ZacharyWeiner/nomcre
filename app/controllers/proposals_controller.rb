class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :edit_details, :payment, :update, :destroy]
  before_action :authenticate_user!
  layout 'adminlte'

  # GET /proposals
  # GET /proposals.json
  def index
    if current_user.user_type == 'creative'
      @proposals = Proposal.where(user: current_user).where(completed: nil).order(:created_at).page params[:page]
    else
      @proposals = Proposal.where(company: current_user.company).where(completed: nil).order(:created_at).page params[:page]
    end
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @notifications = Notification.where(user: current_user).where(notification_object_id: params[:id]).where(read: false)
    @notifications.each do |note|
      note.read = true
      note.save
    end
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  def edit_details
  end

  # POST /proposals
  # POST /proposals.json
  def create
    unless params[:proposal][:instagram_1].nil?
        proposal_params[:instagram_1] = params[:proposal][:instagram_1].gsub!("@", "")
      end
      unless params[:proposal][:instagram_2].nil?
        proposal_params[:instagram_2] = params[:proposal][:instagram_2].gsub!("@", "")
      end
      unless params[:proposal][:instagram_3].nil?
        proposal_params[:instagram_3] = params[:proposal][:instagram_3].gsub!("@", "")
      end
      unless params[:proposal][:instagram_4].nil?
        proposal_params[:instagram_4] = params[:proposal][:instagram_4].gsub!("@", "")
      end
    @proposal = Proposal.new(proposal_params)
    unless proposal_params[:bts].nil? || proposal_params[:bts].count == 0
      @proposal.bts.clear
      proposal_params[:bts].each do |bt|
        @proposal.bts << bt
      end
    end
    unless proposal_params[:focus_points].nil? || proposal_params[:focus_points].count == 0
      @proposal.focus_points.clear
      proposal_params[:focus_points].each do |fp|
        @proposal.focus_points << fp
      end
    end

    respond_to do |format|
      if @proposal.save
        set_price(@proposal)
        @chatroom = Chatroom.create!(topic: @proposal.title, proposal: @proposal)
        @chatroom.messages.create!(user: current_user, content: "#{@proposal.company.name}' - '#{@proposal.title} Chat Was Created")
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|

      if @proposal.accepted == true
        format.html { redirect_to @proposal, notice: 'The Proposal Can Not Be Changed After It Has Been Assigned' }
        return redirect_to @proposal
      end
      unless proposal_params[:bts].nil? || proposal_params[:bts].count == 0
        @proposal.bts.clear
        proposal_params[:bts].each do |bt|
          @proposal.bts << bt
        end
      end
      unless proposal_params[:focus_points].nil? || proposal_params[:focus_points].count == 0
        @proposal.focus_points.clear
        proposal_params[:focus_points].each do |fp|
          if fp == "0"

          else

            @proposal.focus_points << fp
          end
        end
      end

      unless params[:proposal][:instagram_1].nil?
        proposal_params[:instagram_1] = params[:proposal][:instagram_1].gsub!("@", "")
      end
      unless params[:proposal][:instagram_2].nil?
        proposal_params[:instagram_2] = params[:proposal][:instagram_2].gsub!("@", "")
      end
      unless params[:proposal][:instagram_3].nil?
        proposal_params[:instagram_3] = params[:proposal][:instagram_3].gsub!("@", "")
      end
      unless params[:proposal][:instagram_4].nil?
        proposal_params[:instagram_4] = params[:proposal][:instagram_4].gsub!("@", "")
      end

      if @proposal.update!(proposal_params)
        set_price(@proposal)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    if @proposal.accepted || @proposal.deposit_paid
      respond_to do |format|
        format.html { redirect_to proposals_url, alert: 'Cannot Delete A Proposal That Has Been Paid For Or Assigned' }
        format.json { head :no_content }
      end
      return
    end
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accepted_requests
    set_proposal
    @accepted = @proposal.proposal_requests.where(accepted: true)
  end

  def copy
    set_proposal
    @new_proposal = Proposal.new
    @new_proposal.title = "Copy_of "+@proposal.title
    @new_proposal.content = @proposal.content
    @new_proposal.company = @proposal.company
    @new_proposal.proposal_type = @proposal.proposal_type
    @new_proposal.deadline = @proposal.deadline
    @new_proposal.bts = @proposal.bts
    @new_proposal.add_ons = @proposal.add_ons
    @new_proposal.focus_points = @proposal.focus_points
    @new_proposal.time_of_day = @proposal.time_of_day
    @new_proposal.background = @proposal.background
    @new_proposal.location_id = @proposal.location_id
    @new_proposal.shoot_type = @proposal.shoot_type
    @new_proposal.raw = @proposal.raw
    @new_proposal.background_note = @proposal.background_note
    @new_proposal.instagram_1 = @proposal.instagram_1
    @new_proposal.instagram_2 = @proposal.instagram_2
    @new_proposal.instagram_3 = @proposal.instagram_3
    @new_proposal.instagram_4 = @proposal.instagram_4
    @new_proposal.image_board_1 = @proposal.image_board_1
    @new_proposal.image_board_2 = @proposal.image_board_2
    @new_proposal.image_board_3 = @proposal.image_board_3
    @new_proposal.image_board_4 = @proposal.image_board_4
    @new_proposal.save!
    set_price(@proposal)
    @chatroom = Chatroom.create!(topic: @new_proposal.title, proposal: @new_proposal)
    @chatroom.messages.create!(user: current_user, content: "#{@new_proposal.company.name}' - '#{@proposal.title} Chat Was Created")
    redirect_to @new_proposal
  end

  def payment
  end

  def invoice
    set_proposal
  end


  def requests
    if current_user.user_type == 'creative'
      @requests = ProposalRequest.where(requested: current_user.id)
    end
  end

  def create_request
    @proposal = Proposal.find(params[:proposal_id])
    @requested = User.find(params[:user_id])
    @proposal_request = ProposalRequest.where(requested: @requested.id, proposal_id: @proposal.id ).first
    if @proposal_request.nil?
      @proposal_request = ProposalRequest.create(requested_by: current_user.id, requested: @requested.id, proposal_id: @proposal.id )
    end
    send_notification(@requested.id, "New Request", @proposal_request.id)
    ProposalMailer.request_created(@proposal_request).deliver_now
    redirect_to @proposal
  end

  def accept_request
    @proposal = Proposal.find(params[:proposal_id])
    @proposal_request = ProposalRequest.where(requested: current_user.id, proposal_id: @proposal.id ).first
    @proposal_request.accepted = true
    @proposal_request.save
    send_notification(@proposal_request.requested_by, "Request Accepted", @proposal.id)
    ProposalMailer.request_accepted(@proposal_request).deliver_now!
    redirect_to proposal_requests_path
  end

  def approve_request
    @proposal = Proposal.find(params[:proposal_id])
    @proposal_request = ProposalRequest.where(requested_by: current_user.id, proposal_id: @proposal.id, accepted: true).first
    @proposal_request.approved = true
    @proposal_request.save
    @proposal.accepted = true
    @proposal.user = User.find(@proposal_request.requested)
    @proposal.save
    @proposal.create_tasks
    @proposal.tasks.each do |task|
      task.user_id = @proposal_request.requested
      task.save
    end
    @proposal.chatroom.messages.create!(user: @proposal.user, content: "#{@proposal.user.name} has been added to the chat")
    send_notification(@proposal_request.requested, "New Message", @proposal.chatroom.id)
    send_notification(@proposal_request.requested, "Proposal Assigned", @proposal.id)
    send_notification(@proposal_request.requested, "Task", @proposal.id)
    ProposalMailer.proposal_assigned(@proposal_request).deliver_now!
    redirect_to @proposal
  end

  def completed
    if current_user.user_type.downcase == 'creative'
      @proposals = Proposal.where(user: current_user).where(completed: true).order(:completed_on).reverse
    else
      @proposals = Proposal.where(company: current_user.company).where(completed: true).order(:completed_on).reverse
    end
  end

  def send_email
    set_proposal
    ProposalMailer.deposit_received(@proposal).deliver_now
    redirect_to @proposal
  end

  def send_creative_assigned_email
    set_proposal
    ProposalMailer.proposal_assigned(@proposal).deliver_now
    redirect_to @proposal
  end
  private
    def send_notification(user_id, notification_type, request_id)
      notification = Notification.where(user_id: user_id, notification_type: notification_type, notification_object_id: request_id).first
      if notification.nil?
        notification = Notification.create!(user_id: user_id, notification_type: notification_type, notification_object_id: request_id, read: false)
      end
    end

    def set_price(proposal)
      if proposal.proposal_type == 'photo'
        proposal.price =  6999
      elsif proposal.proposal_type == 'video'
        proposal.price =  9999
      elsif proposal.proposal_type == 'drone'
        proposal.price =  1000
      end
      proposal.save
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      unless params[:id].nil?
        @proposal = Proposal.find(params[:id])
      else
        @proposal = Proposal.find(params[:proposal_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:title,
                                      :content,
                                      :deadline,
                                      :price,
                                      :accepted,
                                      :company_id,
                                      :proposal_type,
                                      :completed,
                                      :completed_on,
                                      :paid,
                                      :charge_id,
                                      :focus_points,
                                      :time_of_day,
                                      :location_id,
                                      :background,
                                      :model_release,
                                      :shoot_type,
                                      :raw,
                                      :background_note,
                                      :instagram_1,
                                      :instagram_2,
                                      :instagram_3,
                                      :instagram_4,
                                      :image_board_1,
                                      :image_board_2,
                                      :image_board_3,
                                      :image_board_4,
                                      bts: [],
                                      focus_points: [],
                                      assistants_attributes: [:id, :name, :paypal_email, :phone, :rate, :assistant_type, :location_id, :_destroy])
    end
end
