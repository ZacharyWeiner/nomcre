class SceneTypesController < ApplicationController
  before_action :set_scene_type, only: [:show, :edit, :update, :destroy]

  # GET /scene_types
  # GET /scene_types.json
  def index
    @scene_types = SceneType.all
  end

  # GET /scene_types/1
  # GET /scene_types/1.json
  def show
  end

  # GET /scene_types/new
  def new
    @scene_type = SceneType.new
  end

  # GET /scene_types/1/edit
  def edit
  end

  # POST /scene_types
  # POST /scene_types.json
  def create
    @scene_type = SceneType.new(scene_type_params)

    respond_to do |format|
      if @scene_type.save
        format.html { redirect_to @scene_type, notice: 'Scene type was successfully created.' }
        format.json { render :show, status: :created, location: @scene_type }
      else
        format.html { render :new }
        format.json { render json: @scene_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scene_types/1
  # PATCH/PUT /scene_types/1.json
  def update
    respond_to do |format|
      if @scene_type.update(scene_type_params)
        format.html { redirect_to @scene_type, notice: 'Scene type was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene_type }
      else
        format.html { render :edit }
        format.json { render json: @scene_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scene_types/1
  # DELETE /scene_types/1.json
  def destroy
    @scene_type.destroy
    respond_to do |format|
      format.html { redirect_to scene_types_url, notice: 'Scene type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene_type
      @scene_type = SceneType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scene_type_params
      params.require(:scene_type).permit(:name)
    end
end
