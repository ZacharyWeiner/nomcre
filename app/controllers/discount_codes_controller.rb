class DiscountCodesController < ApplicationController
  before_action :set_discount_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize
  # GET /discount_codes
  # GET /discount_codes.json
  def index
    @discount_codes = DiscountCode.all
  end

  # GET /discount_codes/1
  # GET /discount_codes/1.json
  def show
  end

  # GET /discount_codes/new
  def new
    @discount_code = DiscountCode.new
  end

  # GET /discount_codes/1/edit
  def edit
  end

  # POST /discount_codes
  # POST /discount_codes.json
  def create
    @discount_code = DiscountCode.new(discount_code_params)

    respond_to do |format|
      if @discount_code.save
        format.html { redirect_to @discount_code, notice: 'Discount code was successfully created.' }
        format.json { render :show, status: :created, location: @discount_code }
      else
        format.html { render :new }
        format.json { render json: @discount_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discount_codes/1
  # PATCH/PUT /discount_codes/1.json
  def update
    respond_to do |format|
      if @discount_code.update(discount_code_params)
        format.html { redirect_to @discount_code, notice: 'Discount code was successfully updated.' }
        format.json { render :show, status: :ok, location: @discount_code }
      else
        format.html { render :edit }
        format.json { render json: @discount_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_codes/1
  # DELETE /discount_codes/1.json
  def destroy
    @discount_code.destroy
    respond_to do |format|
      format.html { redirect_to discount_codes_url, notice: 'Discount code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount_code
      @discount_code = DiscountCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_code_params
      params.require(:discount_code).permit(:code, :discount_type, :expiration_date, :max_uses)
    end

    def authorize
      unless current_user.role == 0
        redirect_to root_path
      end
    end
end
