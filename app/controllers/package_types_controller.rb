class PackageTypesController < ApplicationController
  before_action :set_package_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  layout :set_layout

  # GET /package_types
  # GET /package_types.json
  def index
    @package_types = PackageType.all
  end

  # GET /package_types/1
  # GET /package_types/1.json
  def show
  end

  # GET /package_types/new
  def new
    @package_type = PackageType.new
    @header_images = HeaderImage.all
  end

  # GET /package_types/1/edit
  def edit
    @header_images = HeaderImage.all
  end

  # POST /package_types
  # POST /package_types.json
  def create
    @package_type = PackageType.new(package_type_params)

    respond_to do |format|
      if @package_type.save
        format.html { redirect_to @package_type, notice: 'package type was successfully created.' }
        format.json { render :show, status: :created, location: @package_type }
      else
        format.html { render :new }
        format.json { render json: @package_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /package_types/1
  # PATCH/PUT /package_types/1.json
  def update
    respond_to do |format|
      if @package_type.update(package_type_params)
        format.html { redirect_to @package_type, notice: 'package type was successfully updated.' }
        format.json { render :show, status: :ok, location: @package_type }
      else
        format.html { render :edit }
        format.json { render json: @package_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_types/1
  # DELETE /package_types/1.json
  def destroy
    @package_type.destroy
    respond_to do |format|
      format.html { redirect_to package_types_url, notice: 'package type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_type
      @package_type = PackageType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_type_params
      params.require(:package_type).permit(:title, :subtitle, :description, :description_image, :example_image, :example_video, :header_image_id, :show_in_menu, :menu_link_text, :minimum_images, :minimum_videos, :max_models, :base_price, :order, :example_video_description, :example_image_description, :example_video_thumbnail)
    end

    def set_layout
      if action_name == "show" #|| action_name == 'index'
        return 'khaki'
      else
        return 'adminlte'
      end
    end
end
