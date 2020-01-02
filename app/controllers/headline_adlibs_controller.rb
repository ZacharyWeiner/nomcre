class HeadlineAdlibsController < ApplicationController
  before_action :send_to_new, only:[:index, :show, :edit, :create, :update, :destroy]
  before_action :set_headline_adlib, only: [:show, :edit, :update, :destroy]


  # GET /headline_adlibs
  # GET /headline_adlibs.json
  def index
    @headline_adlibs = HeadlineAdlib.all
  end

  # GET /headline_adlibs/1
  # GET /headline_adlibs/1.json
  def show
  end

  # GET /headline_adlibs/new
  def new
    @headline_adlib = HeadlineAdlib.new
    #offset = rand(HeadlineAdlib.count)
    @adlibs = HeadlineAdlib.all.take(5)

  end

  # GET /headline_adlibs/1/edit
  def edit
  end

  # POST /headline_adlibs
  # POST /headline_adlibs.json
  def create
    # @headline_adlib = HeadlineAdlib.new(headline_adlib_params)

    # respond_to do |format|
    #   if @headline_adlib.save
    #     format.html { redirect_to @headline_adlib, notice: 'Headline adlib was successfully created.' }
    #     format.json { render :show, status: :created, location: @headline_adlib }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @headline_adlib.errors, status: :unprocessable_entity }
    #   end
    # end


    @headline_adlib = HeadlineAdlib.new(title: "print this")
  end

  def personalization
  end


  def magic
    if params[:contact]
      @ad_answers = AdlibAnswer.where(contact: params[:contact]).first
      if @ad_answers.nil?
        @ad_answers = AdlibAnswer.create(contact: params[:contact], answers: params)
      else
        @ad_answers = AdlibAnswer.update(contact: params[:contact], answers: params)
      end
    end
    @adlibs = []
    @adlib_ids = []
    counter = 0
    while counter < 5
      random = rand(HeadlineAdlib.count)
      adlib = HeadlineAdlib.offset(random).first
      unless @adlib_ids.include?(adlib.id)
        p adlib.id
        @adlib_ids << adlib.id
        @adlibs << adlib
        counter = counter + 1
      end
    end
     @adlibs
  end

  # PATCH/PUT /headline_adlibs/1
  # PATCH/PUT /headline_adlibs/1.json
  def update
    respond_to do |format|
      if @headline_adlib.update(headline_adlib_params)
        format.html { redirect_to @headline_adlib, notice: 'Headline adlib was successfully updated.' }
        format.json { render :show, status: :ok, location: @headline_adlib }
      else
        format.html { render :edit }
        format.json { render json: @headline_adlib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headline_adlibs/1
  # DELETE /headline_adlibs/1.json
  def destroy
    @headline_adlib.destroy
    respond_to do |format|
      format.html { redirect_to headline_adlibs_url, notice: 'Headline adlib was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headline_adlib
      @headline_adlib = HeadlineAdlib.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def headline_adlib_params
      params.require(:headline_adlib).permit(:title, :stage)
    end

    def send_to_new
      if current_user.nil?
        redirect_to new_headline_adlib_path
      end
    end
end
