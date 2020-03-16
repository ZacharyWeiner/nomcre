class HappyBirthdayVideosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create_from_remote]
  before_action :set_happy_birthday_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :by_name, :create_from_remote]
  before_action :authorize, except: [:show, :by_name, :create_from_remote]
  layout :set_layout
  # GET /happy_birthday_videos
  # GET /happy_birthday_videos.json
  def index
    @happy_birthday_videos = HappyBirthdayVideo.all
  end

  # GET /happy_birthday_videos/1
  # GET /happy_birthday_videos/1.json
  def show
  end

  # GET /happy_birthday_videos/new
  def new
    @happy_birthday_video = HappyBirthdayVideo.new
  end

  # GET /happy_birthday_videos/1/edit
  def edit
  end

  # POST /happy_birthday_videos
  # POST /happy_birthday_videos.json
  def create
    @happy_birthday_video = HappyBirthdayVideo.new(happy_birthday_video_params)
    @happy_birthday_video.slug = Digest::MD5.hexdigest @happy_birthday_video.name
    @happy_birthday_video.name = @happy_birthday_video.name.downcase
    respond_to do |format|
      if @happy_birthday_video.save
        format.html { redirect_to @happy_birthday_video, notice: 'Happy birthday video was successfully created.' }
        format.json { render :show, status: :created, location: @happy_birthday_video }
      else
        format.html { render :new }
        format.json { render json: @happy_birthday_video.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_from_remote
    params_val = params[:happy_birthday_video]
    hbd_params = JSON.parse params_val[0]
    name = hbd_params['name']
    slug = Digest::MD5.hexdigest name
    remote_file_url = hbd_params['remote_file_url']
    remote_cover_url = hbd_params['remote_cover_url']
    
    @happy_birthday_video = HappyBirthdayVideo.new(name: name,
                                        slug: slug,
                                        remote_file_url: remote_file_url,
                                        remote_cover_url: remote_cover_url)
    
    respond_to do |format|
      if @happy_birthday_video.save
        format.json { head :no_content, status: :ok, location: @happy_birthday_video }
      else 
         format.json { render json: @happy_birthday_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /happy_birthday_videos/1
  # PATCH/PUT /happy_birthday_videos/1.json
  def update
    respond_to do |format|
      if @happy_birthday_video.update(happy_birthday_video_params)
        format.html { redirect_to @happy_birthday_video, notice: 'Happy birthday video was successfully updated.' }
        format.json { render :show, status: :ok, location: @happy_birthday_video }
      else
        format.html { render :edit }
        format.json { render json: @happy_birthday_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /happy_birthday_videos/1
  # DELETE /happy_birthday_videos/1.json
  def destroy
    @happy_birthday_video.destroy
    respond_to do |format|
      format.html { redirect_to happy_birthday_videos_url, notice: 'Happy birthday video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def by_name
    if params[:name]
      puts "The Name is #{params[:name]}"
    end
    @happy_birthday_video = HappyBirthdayVideo.where(name: params[:name].downcase!).first
    puts @happy_birthday_video.name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_happy_birthday_video
      if params[:id]
        @happy_birthday_video = HappyBirthdayVideo.find(params[:id])
      elsif params[:slug]
        @happy_birthday_video = HappyBirthdayVideo.where(slug: params[:slug]).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def happy_birthday_video_params
      params.require(:happy_birthday_video).permit(:name, :file, :cover)
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
