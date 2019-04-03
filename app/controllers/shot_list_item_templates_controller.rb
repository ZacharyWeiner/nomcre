class ShotListItemTemplatesController < ApplicationController
  before_action :set_shot_list_item_template, only: [:show, :edit, :update, :destroy, :copy]
  before_action :set_task_group
  layout 'black_dashboard'
  # GET /shot_list_item_templates
  # GET /shot_list_item_templates.json
  def index
    @shot_list_item_templates = ShotListItemTemplate.all
  end

  # GET /shot_list_item_templates/1
  # GET /shot_list_item_templates/1.json
  def show
  end

  # GET /shot_list_item_templates/new
  def new
    @shot_list_item_template = ShotListItemTemplate.new

  end

  # GET /shot_list_item_templates/1/edit
  def edit
  end

  # POST /shot_list_item_templates
  # POST /shot_list_item_templates.json
  def create
    @shot_list_item_template = ShotListItemTemplate.new(shot_list_item_template_params)
    respond_to do |format|
      if @shot_list_item_template.save
        format.html { redirect_to admin_task_groups_path(@task_group), notice: 'Shot list item template was successfully created.' }
        format.json { render :show, status: :created, location: @shot_list_item_template }
      else
        format.html { render :new }
        format.json { render json: @shot_list_item_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def copy
    @new_item_template = ShotListItemTemplate.new
    @new_item_template.task_group = @shot_list_item_template.task_group
    @new_item_template.description = @shot_list_item_template.description
    @new_item_template.background = @shot_list_item_template.background
    @new_item_template.item_type = @shot_list_item_template.item_type
    @new_item_template.item_type = @shot_list_item_template.item_type
    @new_item_template.focus_point = @shot_list_item_template.focus_point
    @new_item_template.reference_image = @shot_list_item_template.reference_image
    @new_item_template.aspect_ratio = @shot_list_item_template.aspect_ratio
    @new_item_template.frame_rate = @shot_list_item_template.frame_rate
    @new_item_template.save!
    redirect_to edit_task_group_shot_list_item_template_path(@new_item_template.task_group, @new_item_template)
  end

  # PATCH/PUT /shot_list_item_templates/1
  # PATCH/PUT /shot_list_item_templates/1.json
  def update
    respond_to do |format|
      if @shot_list_item_template.update(shot_list_item_template_params)
        format.html { redirect_to admin_task_groups_path(@task_group), notice: 'Shot list item template was successfully updated.' }
        format.json { render :show, status: :ok, location: @shot_list_item_template }
      else
        format.html { render :edit }
        format.json { render json: @shot_list_item_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shot_list_item_templates/1
  # DELETE /shot_list_item_templates/1.json
  def destroy
    @shot_list_item_template.destroy
    respond_to do |format|
      format.html { redirect_to admin_task_groups_path(@task_group), notice: 'Shot list item template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task_group
      if params[:task_group_id]
        @task_group = TaskGroup.find(params[:task_group_id])
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_shot_list_item_template
      if params[:shot_list_item_template_id]
        @shot_list_item_template = ShotListItemTemplate.find(params[:shot_list_item_template_id])
      else
        @shot_list_item_template = ShotListItemTemplate.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shot_list_item_template_params
      params.require(:shot_list_item_template).permit(:description, :background, :item_type, :focus_point, :reference_image, :aspect_ratio, :frame_rate, :task_group_id)
    end
end
