class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]
  #TODO: Authorize Tasks
  layout 'black_dashboard'
  # GET /tasks
  # GET /tasks.json
  def index

    if params[:shoot_id]
      @shoot = Shoot.find(params[:shoot_id])
      @tasks = @shoot.tasks.where(completed: nil)
      @completed_tasks = @shoot.tasks.where(completed: true)
    elsif current_user.is_admin
      @tasks = Task.all.where(completed: nil)
      @completed_tasks = Task.all.where(completed: true)
    else
      task_ids = current_user.shoots.where(is_complete: nil).map{|s| s.tasks.map{|t| t.id}}[0]
      @tasks = Task.where(id: task_ids)
      @completed_tasks = current_user.tasks.where(completed: true)
    end
    #TODO: Use helper for notifications
    @notifications = Notification.where(user: current_user).where(notification_type: "Task").where(read: false)
    @notifications.each do |note|
      note.read = true
      note.save
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    #TODO: GET RID OF PROPOSAL
    respond_to do |format|
      if @task.save
        if @task.proposal.nil? == false
          format.html { redirect_to proposal_path(@task.proposal, :active => 'tasks'), notice: 'The Task was successfully created.' }
          format.json { render :show, status: :created, location: @task }
        elsif @task.shoot.nil? == false
          format.html { redirect_to shoot_path(@task.shoot, :active => 'tasks'), notice: 'The Task was successfully created.' }
          format.json { render :show, status: :created, location: @task }
        else
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
       end
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    #TODO: Fix This
    new_path = params[:redirect]
    @task.completed = true
    respond_to do |format|
      if @task.save!
        if !@task.proposal.nil?
          format.html { redirect_to @task.proposal, notice: 'Task was successfully completed.' }
        elsif !@task.shoot.nil?
          if params[:popped]
            format.html { redirect_to shoot_tasks_poppedout_path(@task.shoot) }
          else
            format.html { redirect_to shoot_path(@task.shoot, :active => 'tasks'), notice: 'Task was successfully completed.' }
          end
        elsif !@task.project.nil?
          format.html { redirect_to @task.project, notice: 'Task was successfully completed.' }
        else
          format.html { redirect_to @task, notice: 'Task was successfully completed.' }
        end
      else
        format.html { redirect_to @task, notice: 'Task could not be saved' }
      end
    end
  end

  def popped_out
    @shoot = Shoot.find(params[:shoot_id])
    @tasks = @shoot.tasks.where(completed: nil)
    @completed_tasks = @shoot.tasks.where(completed: true)
    render :layout => 'poppedout'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      if params[:task_id].nil?
        @task = Task.find(params[:id])
      else
        @task = Task.find(params[:task_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :description, :deadline, :completed, :company_id, :shoot_id)
    end
end
