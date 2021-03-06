class LeadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:create]
  layout 'black_dashboard'
  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all.page params[:page]
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    @lead_note = LeadNote.new
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    if current_user
      @lead.rep_id = current_user.id
    end
    respond_to do |format|
      if @lead.save
        if lead_params[:source] == 'landing'
          send_notification(@lead)
        end
        if current_user.is_admin
           format.html { redirect_to admin_leads_path, notice: 'Lead was successfully created.' }
        else
          format.html { redirect_to landing_thank_you_path, notice: 'Lead was successfully created.' }
          format.json { render :show, status: :created, location: @lead }
        end
      else
        format.html { redirect_to landing_marketing_path }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        if current_user.is_admin
           format.html { redirect_to admin_leads_path, notice: 'Lead was successfully created.' }
        else
          format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
          format.json { render :show, status: :ok, location: @lead }
        end
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Lead.import_file(params[:file])
    redirect_to admin_leads_path, notice: 'successfully Imported'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:name, :email, :company_name, :office_phone, :cell_phone, :last_contacted, :next_contact, :next_contact_time, :source)
    end

    def authorize
      if current_user.role.nil? == true
        redirect_to root_path
      end
    end

    def send_notification(lead)
      @twilio_number = ENV['TWILIO_NUMBER']
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_CLIENT_ID']
      time_str = ((Time.now).localtime).strftime("%I:%M%p on %b. %d, %Y")
      #reminder = "Hi Zack. Just a reminder that you have an appointment coming up at #{time_str}."
      text = "#{lead.name} from #{lead.company_name} just filled out the form and their callback number is #{lead.cell_phone}"
      message = @client.api.account.messages.create(
        :from => @twilio_number,
        :to => '19546461240',
        :body => text,
      )
    end
end
