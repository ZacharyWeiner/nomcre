class ShotListItemTemplatesController < ApplicationController
  before_action :set_shot_list_item_template, only: [:show, :edit, :update, :destroy]
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
    @task_group = TaskGroup.find(params[:task_group_id])
  end

  # GET /shot_list_item_templates/1/edit
  def edit
  end

  # POST /shot_list_item_templates
  # POST /shot_list_item_templates.json
  def create
    @shot_list_item_template = ShotListItemTemplate.new(shot_list_item_template_params)
    @task_group = TaskGroup.find(shot_list_item_template_params[:task_group_id])
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

  # PATCH/PUT /shot_list_item_templates/1
  # PATCH/PUT /shot_list_item_templates/1.json
  def update
    respond_to do |format|
      if @shot_list_item_template.update(shot_list_item_template_params)
        format.html { redirect_to @shot_list_item_template, notice: 'Shot list item template was successfully updated.' }
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
    @task_group = TaskGroup.find(params[:task_group_id])
    @shot_list_item_template.destroy
    respond_to do |format|
      format.html { redirect_to admin_task_groups_path(@task_group), notice: 'Shot list item template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot_list_item_template
      @shot_list_item_template = ShotListItemTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shot_list_item_template_params
      params.require(:shot_list_item_template).permit(:description, :background, :item_type, :focus_point, :reference_image, :aspect_ratio, :frame_rate, :task_group_id)
    end
end
