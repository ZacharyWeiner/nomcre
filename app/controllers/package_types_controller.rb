class PackageTypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_package_type, only: [:show, :edit, :update, :destroy, :new_from_template]
  before_action :authorize, only: [:new, :edit, :create, :update, :destroy]
  layout :set_layout

  # GET /package_types
  # GET /package_types.json
  def index
    if current_user
      if current_user.role == 0
        @package_types = PackageType.all
      else
         @package_types = where(show_on_index: true)
      end
    else
      @package_types = PackageType.where(show_in_menu: true)
    end
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

  def new_from_template
    @project = @package_type.create_project current_user, Date.today + 30.days
    redirect_to edit_project_path(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_type
      if params[:package_type_id]
        @package_type = PackageType.find(params[:package_type_id])
      else
        @package_type = PackageType.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_type_params
      params.require(:package_type).permit(:title,
                                          :subtitle,
                                          :page_header,
                                          :description_text_title,
                                          :description_text_subtitle,
                                          :description,
                                          :description_image,
                                          :example_image_title,
                                          :example_image_subtitle,
                                          :example_image,
                                          :example_video_title,
                                          :example_video_subtitle,
                                          :example_video,
                                          :header_image_id,
                                          :show_in_menu,
                                          :menu_link_text,
                                          :minimum_images,
                                          :minimum_videos,
                                          :max_models,
                                          :base_price,
                                          :order,
                                          :example_video_description,
                                          :example_image_description,
                                          :example_video_thumbnail,
                                          :show_on_index,
                                          :call_to_action_text,
                                          :add_default_shot_list)
    end

    def authorize
      if !current_user.is_admin
        redirect_to package_types_path
      end
    end

    def set_layout
      if action_name == "show" || (action_name == 'index' &&  ( current_user.nil? || current_user.role == nil))
        return 'khaki'
      else
        return 'black_dashboard'
      end
    end
end
