class WaitlistsController < ApplicationController
  before_action :set_waitlist, only: [:show, :edit, :update, :destroy]
  layout 'khaki'
  # GET /waitlists
  # GET /waitlists.json
  def index
    @waitlists = Waitlist.all
  end

  # GET /waitlists/1
  # GET /waitlists/1.json
  def show
  end

  # GET /waitlists/new
  def new
    @waitlist = Waitlist.new
  end

  # GET /waitlists/1/edit
  def edit
  end

  # POST /waitlists
  # POST /waitlists.json
  def create
    @waitlist = Waitlist.new(waitlist_params)

    respond_to do |format|
      if @waitlist.save
        WaitlistMailer.joined_waitlist(@waitlist.email).deliver_now!
        format.html { redirect_to @waitlist, notice: 'Waitlist was successfully created.' }
        format.json { render :show, status: :created, location: @waitlist }
      else
        format.html { render :new }
        format.json { render json: @waitlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waitlists/1
  # PATCH/PUT /waitlists/1.json
  def update
    respond_to do |format|
      if @waitlist.update(waitlist_params)
        format.html { redirect_to @waitlist, notice: 'Waitlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @waitlist }
      else
        format.html { render :edit }
        format.json { render json: @waitlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waitlists/1
  # DELETE /waitlists/1.json
  def destroy
    @waitlist.destroy
    respond_to do |format|
      format.html { redirect_to waitlists_url, notice: 'Waitlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_joined_waitlist_email
    WaitlistMailer.joined_waitlist("zack@nomcre.com").deliver_now!
    redirect_to root_path
  end

  def send_user_accepted_email
    byebug
    CreativeMailer.creative_accepted("zack@nomcre.com").deliver_now!
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waitlist
      @waitlist = Waitlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waitlist_params
      params.require(:waitlist).permit(:name, :email, :instagram, :px500, :facebook, :phone, :website, :smugmug, :question_1)
    end
end
