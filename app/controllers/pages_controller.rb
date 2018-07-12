class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy, :publish]
  before_action :authorize, except: [:show]
  layout :set_layout
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    set_page
    if (current_user && current_user.role >=0)
      if @page.status != 'published'
        @page.title = @page.title + " - Draft"
      end
    else
      if(@page.status == 'published')
        @page.views = @page.views + 1
        @page.save
      else
        redirect_to root_path
      end
    end
    @page_sections = @page.page_sections.order(:order);
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
    @page_sections = @page.page_sections.order(:order);
    @new_section = PageSection.new
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)
    @page.status = 'draft'
    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_page_path(@page), notice: 'Page was successfully created.' }
        format.json { render :edit, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publish
    if @page.status != 'published'
      @page.status = 'published'
    else
      @page.status = 'draft'
    end
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      if params[:page_id]
        @page = Page.find(params[:page_id])
      else
        @page = Page.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :content, :views, :header_image, :is_blog, :status)
    end

    def authorize
      if current_user.nil?
      redirect_to root_path
      else
        if current_user.role >= 1
          redirect_to root_path
        end
      end
    end

    def set_layout
      if action_name == "show"
        return 'khaki'
      else
        return 'adminlte'
      end
    end

end
