class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :wizard]
  before_action :authorize, only: [:edit, :update, :delete]
  layout 'black_dashboard'


  # GET /projects
  # GET /projects.json
  def index
    #MTODO: Move this to a helper
    if !current_user.company.nil? && params[:active]
      @projects = current_user.company.projects.where(is_complete: true).where(is_template: nil).uniq
    elsif !current_user.company.nil?
      project_template_ids = Project.where(is_template: true).or(Project.where(is_default_template: true)).map{|e| e.id}
      @projects = current_user.company.projects.where.not(id: project_template_ids)
    elsif params[:active]
      @projects = current_user.projects.where(is_complete: true)
    else
      @projects = current_user.projects.uniq
    end
    if @projects.count == 0
      respond_to do |format|
        format.html { redirect_to new_project_path, notice: "Create Your First Project ... Let's Get Started" }
      end
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    if current_user.is_admin
      @package_types = PackageType.all
    else
      @package_types = PackageType.where(show_on_index: true)
    end
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        if params[:location_id]
          @project.update_shoot_location params[:location_id]
        end
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def payment
  end

  def wizard
  end

  def update_price
    @price = params[:project][:price]
    @project = Project.find(params[:project_id])
    @project.update_price(@price)
    redirect_to admin_edit_project_price_path(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      if params[:project_id ]
        @project = Project.find(params[:project_id])
      else
        @project = Project.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:package_type_id,
                                      :company_id,
                                      :title,
                                      :brief,
                                      :deadline,
                                      :price,
                                      :deposit,
                                      :balance,
                                      :is_complete,
                                      :completed_on,
                                      :max_user_shot_list,
                                      :mood)
    end

    def authorize
      #TODO: Move this to a helper
      if current_user.is_admin
        return
      end
      if @project.company == current_user.company
        return
      end

      return redirect_to projects_path
    end
end
