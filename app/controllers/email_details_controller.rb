class EmailDetailsController < ApplicationController
  before_action :set_email_detail, only: [:show, :edit, :update, :destroy]

  # GET /email_details
  # GET /email_details.json
  def index
    @email_details = EmailDetail.all
  end

  # GET /email_details/1
  # GET /email_details/1.json
  def show
  end

  # GET /email_details/new
  def new
    @email_detail = EmailDetail.new
  end

  # GET /email_details/1/edit
  def edit
  end

  # POST /email_details
  # POST /email_details.json
  def create
    @email_detail = EmailDetail.new(email_detail_params)

    respond_to do |format|
      if @email_detail.save
        format.html { redirect_to @email_detail, notice: 'Email detail was successfully created.' }
        format.json { render :show, status: :created, location: @email_detail }
      else
        format.html { render :new }
        format.json { render json: @email_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_details/1
  # PATCH/PUT /email_details/1.json
  def update
    respond_to do |format|
      if @email_detail.update(email_detail_params)
        format.html { redirect_to @email_detail, notice: 'Email detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_detail }
      else
        format.html { render :edit }
        format.json { render json: @email_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_details/1
  # DELETE /email_details/1.json
  def destroy
    @email_detail.destroy
    respond_to do |format|
      format.html { redirect_to email_details_url, notice: 'Email detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_detail
      if params[:email_template_id]
        @email_template = EmailTemplate.find(params[:email_template_id])
      end

      if params[:email_id]
        @email = EmailTemplate.find(params[:email_id])
      end

      if params[:email_detail_id]
        @email_detail = EmailDetail.find(params[:id])
      else
        @email_detail = EmailDetail.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_detail_params
      params.require(:email_detail).permit(:email_id, :detail_type, :content, :order)
    end
end
