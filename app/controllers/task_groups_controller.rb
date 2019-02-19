class TaskGroupsController < ApplicationController
  before_action :set_task_group, only: [:show, :edit, :update, :destroy]
  layout 'black_dashboard'
  # GET /task_groups
  # GET /task_groups.json
  def index
    @task_groups = TaskGroup.all
  end

  # GET /task_groups/1
  # GET /task_groups/1.json
  def show
  end

  # GET /task_groups/new
  def new
    @task_group = TaskGroup.new
  end

  # GET /task_groups/1/edit
  def edit
  end

  # POST /task_groups
  # POST /task_groups.json
  def create
    @task_group = TaskGroup.new(task_group_params)
    respond_to do |format|
      if @task_group.save!
        if params[:task_group][:redirect]
          format.html { redirect_to new_shoot_shot_list_item_path(@task_group.shoot), notice: 'Task group was successfully created.' }
          format.json { render :show, status: :created, location: @task_group }
        elsif params[:task_group][:admin]
          format.html { redirect_to admin_task_groups_path, notice: 'Task group was successfully created.' }
        else
          format.html { redirect_to @task_group, notice: 'Task group was successfully created.' }
          format.json { render :show, status: :created, location: @task_group }
        end
      else
        format.html { render :new }
        format.json { render json: @task_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_groups/1
  # PATCH/PUT /task_groups/1.json
  def update
    respond_to do |format|
      if @task_group.update(task_group_params)
        format.html { redirect_to @task_group, notice: 'Task group was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_group }
      else
        format.html { render :edit }
        format.json { render json: @task_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_groups/1
  # DELETE /task_groups/1.json
  def destroy
    @task_group.destroy
    respond_to do |format|
      format.html { redirect_to task_groups_url, notice: 'Task group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def copy_group_to_shoot
    byebug
    task_group = TaskGroup.find(params[:task_group_id])
    shoot = Shoot.find(params[:shoot_id])

    new_task_group = TaskGroup.create(shoot_id: shoot.id, title: task_group.title)
    task_group.shot_list_item_templates.each do |temp|
      shot_list_item = ShotListItem.create!(description: temp.description,
                                            background: temp.background,
                                            item_type: temp.item_type,
                                            focus_point: temp.focus_point,
                                            reference_image: temp.reference_image,
                                            aspect_ratio: temp.aspect_ratio,
                                            shoot_id: shoot.id,
                                            added_by_id: current_user.id,
                                            frame_rate: temp.frame_rate,
                                            task_group_id: new_task_group.id)
      shot_list_item.create_related_task shot_list_item.description
      respond_to do |format|
        format.html { redirect_to shoot_path(shoot, :active => 'shotlist'), notice: "The Group (#{new_task_group.title}) was Added to The Shoot." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_group
      @task_group = TaskGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_group_params
      params.require(:task_group).permit(:title, :shoot_id, :complete, :approver_id, :is_template, :shoot_type)
    end
end
