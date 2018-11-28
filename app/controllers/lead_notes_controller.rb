class LeadNotesController < ApplicationController
  before_action :set_lead_note, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  layout 'black_dashboard'

  # GET /lead_notes
  # GET /lead_notes.json
  def index
    @lead_notes = LeadNote.all
  end

  # GET /lead_notes/1
  # GET /lead_notes/1.json
  def show
  end

  # GET /lead_notes/new
  def new
    @lead_note = LeadNote.new
  end

  # GET /lead_notes/1/edit
  def edit
  end

  # POST /lead_notes
  # POST /lead_notes.json
  def create
    @lead_note = LeadNote.new(lead_note_params)
    @lead_note.lead = Lead.find(lead_note_params[:lead_id])
    respond_to do |format|
      if @lead_note.save
        format.html { redirect_to @lead_note, notice: 'Lead note was successfully created.' }
        format.json { render :show, status: :created, location: @lead_note }
      else
        format.html { render :new }
        format.json { render json: @lead_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lead_notes/1
  # PATCH/PUT /lead_notes/1.json
  def update
    respond_to do |format|
      if @lead_note.update(lead_note_params)
        format.html { redirect_to @lead_note, notice: 'Lead note was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead_note }
      else
        format.html { render :edit }
        format.json { render json: @lead_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lead_notes/1
  # DELETE /lead_notes/1.json
  def destroy
    @lead_note.destroy
    respond_to do |format|
      format.html { redirect_to lead_notes_url, notice: 'Lead note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_note
      if params[:lead_note_id]
        @lead_note = LeadNote.find(params[:id])
      else
        @lead_note = LeadNote.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_note_params
      params.require(:lead_note).permit(:note, :lead_id)
    end

    def authorize
      if current_user.role.nil? == true
        redirect_to root_path
      end
    end
end
