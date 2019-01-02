class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize, except: [:create]
  layout 'black_dashboard'

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        if @document.proposal
          format.html { redirect_to proposal_path(@document.proposal, :active => 'disclosures'), notice: 'Document was successfully created.' }
          format.json { render :show, status: :created, location: @document }
        else
          format.html { redirect_to @document, notice: 'Document was successfully created.' }
          format.json { render :show, status: :created, location: @document }
        end
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    def authorize
      if @document.nil?
        return redirect_to root_path
      end
      if (current_user && current_user.is_admin) || current_user == @document.user || current_user.company == @document.company
      else
      redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:proposal_id, :user_id, :company_id, :assistant_id, :title, :file, :media, :document_type, :is_template)
    end

end
