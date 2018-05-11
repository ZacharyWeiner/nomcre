class ShowcaseVideosController < ApplicationController
  before_action :set_showcase_video, only: [:show, :play, :edit, :update, :destroy]
  before_action :authorize, except: [:play]

  layout :set_layout
  # GET /showcase_videos
  # GET /showcase_videos.json
  def index
    @showcase_videos = ShowcaseVideo.all
  end

  def play
  end

  # GET /showcase_videos/1
  # GET /showcase_videos/1.json
  def show
  end

  # GET /showcase_videos/new
  def new
    @showcase_video = ShowcaseVideo.new
  end

  # GET /showcase_videos/1/edit
  def edit
  end

  # POST /showcase_videos
  # POST /showcase_videos.json
  def create
    @showcase_video = ShowcaseVideo.new(showcase_video_params)

    respond_to do |format|
      if @showcase_video.save
        format.html { redirect_to @showcase_video, notice: 'Showcase video was successfully created.' }
        format.json { render :show, status: :created, location: @showcase_video }
      else
        format.html { render :new }
        format.json { render json: @showcase_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showcase_videos/1
  # PATCH/PUT /showcase_videos/1.json
  def update
    respond_to do |format|
      if @showcase_video.update(showcase_video_params)
        format.html { redirect_to @showcase_video, notice: 'Showcase video was successfully updated.' }
        format.json { render :show, status: :ok, location: @showcase_video }
      else
        format.html { render :edit }
        format.json { render json: @showcase_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showcase_videos/1
  # DELETE /showcase_videos/1.json
  def destroy
    @showcase_video.destroy
    respond_to do |format|
      format.html { redirect_to showcase_videos_url, notice: 'Showcase video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_layout
      theme = 'adminlte'
       if action_name == "play"
          theme = 'khaki'
       end
       theme
    end
    def authorize
      if current_user.nil? || current_user.role != 0
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_showcase_video
      if params[:showcase_video_id]
        @showcase_video = ShowcaseVideo.find(params[:showcase_video_id])
      else
        @showcase_video = ShowcaseVideo.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showcase_video_params
      params.require(:showcase_video).permit(:file, :showcase_type, :show, :order, :title, :description, :thumbnail)
    end
end
