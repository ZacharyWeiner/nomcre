class HeaderImagesController < ApplicationController
  before_action :set_header_image, only: [:show, :edit, :update, :destroy]
  layout 'adminlte'

  # GET /header_images
  # GET /header_images.json
  def index
    @header_images = HeaderImage.all
  end

  # GET /header_images/1
  # GET /header_images/1.json
  def show
  end

  # GET /header_images/new
  def new
    @header_image = HeaderImage.new
  end

  # GET /header_images/1/edit
  def edit
  end

  # POST /header_images
  # POST /header_images.json
  def create
    @header_image = HeaderImage.new(header_image_params)

    respond_to do |format|
      if @header_image.save
        format.html { redirect_to @header_image, notice: 'Header image was successfully created.' }
        format.json { render :show, status: :created, location: @header_image }
      else
        format.html { render :new }
        format.json { render json: @header_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /header_images/1
  # PATCH/PUT /header_images/1.json
  def update
    respond_to do |format|
      if @header_image.update(header_image_params)
        format.html { redirect_to @header_image, notice: 'Header image was successfully updated.' }
        format.json { render :show, status: :ok, location: @header_image }
      else
        format.html { render :edit }
        format.json { render json: @header_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /header_images/1
  # DELETE /header_images/1.json
  def destroy
    @header_image.destroy
    respond_to do |format|
      format.html { redirect_to header_images_url, notice: 'Header image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_header_image
      @header_image = HeaderImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def header_image_params
      params.require(:header_image).permit(:title, :file, :homepage, :showcase, :creators)
    end
end
