class ShowcaseImagesController < ApplicationController
  before_action :set_showcase_image, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  layout 'black_dashboard'
  # GET /showcase_images
  # GET /showcase_images.json
  def index
    @showcase_images = ShowcaseImage.all
  end

  # GET /showcase_images/1
  # GET /showcase_images/1.json
  def show
  end

  # GET /showcase_images/new
  def new
    @showcase_image = ShowcaseImage.new
  end

  # GET /showcase_images/1/edit
  def edit
  end

  # POST /showcase_images
  # POST /showcase_images.json
  def create
    @showcase_image = ShowcaseImage.new(showcase_image_params)

    respond_to do |format|
      if @showcase_image.save
        format.html { redirect_to @showcase_image, notice: 'Showcase image was successfully created.' }
        format.json { render :show, status: :created, location: @showcase_image }
      else
        format.html { render :new }
        format.json { render json: @showcase_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showcase_images/1
  # PATCH/PUT /showcase_images/1.json
  def update
    respond_to do |format|
      if @showcase_image.update(showcase_image_params)
        format.html { redirect_to @showcase_image, notice: 'Showcase image was successfully updated.' }
        format.json { render :show, status: :ok, location: @showcase_image }
      else
        format.html { render :edit }
        format.json { render json: @showcase_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showcase_images/1
  # DELETE /showcase_images/1.json
  def destroy
    @showcase_image.destroy
    respond_to do |format|
      format.html { redirect_to showcase_images_url, notice: 'Showcase image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize
      if current_user.nil? || current_user.role != 0
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_showcase_image
      @showcase_image = ShowcaseImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showcase_image_params
      params.require(:showcase_image).permit(:file, :showcase_type, :show, :order, :name)
    end
end
