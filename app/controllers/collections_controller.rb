class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  layout :set_layout
  # GET /collections
  # GET /collections.json
  layout 'khaki'
  def index
    if params[:user_id]
      @collections = Collection.where(user_id: params[:user_id])
    else
      if current_user
        if current_user.user_type == 'creative'
          @collections = Collection.where(user: current_user)
        else
          @collections = Collection.all
        end
      else
        @collections = Collection.all
      end
    end
    @collections
  end

  # GET /collections/1
  # GET /collections/1.json
  def show

  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
    render :layout => 'adminlte'
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        UserActivity.create!(activity_type: UserActivityType.collection_added, user_id: current_user.id, object_id: @collection.id)
        format.html { redirect_to new_collection_collection_item_path(@collection), notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:user_id, :title)
    end

    def set_layout
      if action_name == "show" || action_name == 'index'
        return 'khaki'
      else
        return 'adminlte'
      end
    end
end
