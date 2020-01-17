class DeliverableTypesController < ApplicationController
  before_action :set_deliverable_type, only: [:show, :edit, :update, :destroy]

  # GET /deliverable_types
  # GET /deliverable_types.json
  def index
    @deliverable_types = DeliverableType.all
  end

  # GET /deliverable_types/1
  # GET /deliverable_types/1.json
  def show
  end

  # GET /deliverable_types/new
  def new
    @deliverable_type = DeliverableType.new
  end

  # GET /deliverable_types/1/edit
  def edit
  end

  # POST /deliverable_types
  # POST /deliverable_types.json
  def create
    @deliverable_type = DeliverableType.new(deliverable_type_params)

    respond_to do |format|
      if @deliverable_type.save
        format.html { redirect_to @deliverable_type, notice: 'Deliverable type was successfully created.' }
        format.json { render :show, status: :created, location: @deliverable_type }
      else
        format.html { render :new }
        format.json { render json: @deliverable_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliverable_types/1
  # PATCH/PUT /deliverable_types/1.json
  def update
    respond_to do |format|
      if @deliverable_type.update(deliverable_type_params)
        format.html { redirect_to @deliverable_type, notice: 'Deliverable type was successfully updated.' }
        format.json { render :show, status: :ok, location: @deliverable_type }
      else
        format.html { render :edit }
        format.json { render json: @deliverable_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliverable_types/1
  # DELETE /deliverable_types/1.json
  def destroy
    @deliverable_type.destroy
    respond_to do |format|
      format.html { redirect_to deliverable_types_url, notice: 'Deliverable type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliverable_type
      @deliverable_type = DeliverableType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deliverable_type_params
      params.require(:deliverable_type).permit(:name, :specification)
    end
end
