class CongratulationsVideosController < ApplicationController
  before_action :set_congratulations_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :by_name]
  before_action :authorize, except: [:show, :by_name]
  layout :set_layout
  # GET /congratulations_videos
  # GET /congratulations_videos.json
  def index
    @congratulations_videos = CongratulationsVideo.all
  end

  # GET /congratulations_videos/1
  # GET /congratulations_videos/1.json
  def show
  end

  # GET /congratulations_videos/new
  def new
    @congratulations_video = CongratulationsVideo.new
  end

  # GET /congratulations_videos/1/edit
  def edit
  end


  # POST /congratulations_videos
  # POST /congratulations_videos.json
  def create
    @congratulations_video = CongratulationsVideo.new(congratulations_video_params)
    @congratulations_video.slug = Digest::MD5.hexdigest @congratulations_video.name
    @congratulations_video.name = @congratulations_video.name.downcase
    respond_to do |format|
      if @congratulations_video.save
        format.html { redirect_to @congratulations_video, notice: 'Congratulations video was successfully created.' }
        format.json { render :show, status: :created, location: @congratulations_video }
      else
        format.html { render :new }
        format.json { render json: @congratulations_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /congratulations_videos/1
  # PATCH/PUT /congratulations_videos/1.json
  def update
    respond_to do |format|
      if @congratulations_video.update(congratulations_video_params)
        format.html { redirect_to @congratulations_video, notice: 'Congratulations video was successfully updated.' }
        format.json { render :show, status: :ok, location: @congratulations_video }
      else
        format.html { render :edit }
        format.json { render json: @congratulations_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /congratulations_videos/1
  # DELETE /congratulations_videos/1.json
  def destroy
    @congratulations_video.destroy
    respond_to do |format|
      format.html { redirect_to congratulations_videos_url, notice: 'Congratulations video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def by_name
    if params[:name]
      puts "The Name is #{params[:name]}"
    end
    @congratulations_video = CongratulationsVideo.where(name: params[:name].downcase!).first
    puts @congratulations_video.name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_congratulations_video
       if params[:id]
        @congratulations_video = CongratulationsVideo.find(params[:id])
      elsif params[:slug]
        @congratulations_video = CongratulationsVideo.where(slug: params[:slug]).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def congratulations_video_params
      params.require(:congratulations_video).permit(:name, :file, :cover, :slug)
    end

    def authorize
      unless current_user.is_admin
        return redirect_to root_path
      end
    end

    def set_layout
      if action_name == "show" || action_name == "by_name"
        return 'khaki'
      else
        return 'black_dashboard'
      end
    end
end
