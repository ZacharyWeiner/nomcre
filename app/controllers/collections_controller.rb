class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy, :make_featured, :remove_featured]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize, only: [:edit, :update, :destroy]
  layout :set_layout
  # GET /collections
  # GET /collections.json
  layout 'khaki'
  def index
    @collection_ids = []
    #if we are showing a specific user
    if params[:user_id]
      @user_collections = Collection.where(user_id: params[:user_id])
      @user_collections.each do |uc|
        if uc.collection_items.count > 0
          @collection_ids << uc.id
        end
      end
    else
      #if we are NOT showing a specific user
      #if the user is logged in
      if current_user
        #if the current user is a creative show their stuff
        if current_user.user_type == 'creative'
          @collections = Collection.where(user: current_user).page params[:page]
          return
        else
          @response_collections = Collection.all
          @response_collections.each do |uc|
            if uc.collection_items.count > 0
              @collection_ids << uc.id
            end
          end
        end
      #if the user is NOT logged in
      else
         @response_collections = Collection.where(featured: true).order(:created_at)
         @response_collections.each do |uc|
          if uc.collection_items.count > 0
            @collection_ids << uc.id
          end
        end
      end
    end
    @collections = Collection.where(id: @collection_ids).page params[:page]
  end

  # GET /collections/1
  # GET /collections/1.json
  def show

  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  def make_featured
    @collection.featured = true
    @collection.save
    redirect_to admin_collections_path
  end

  def remove_featured
    @collection.featured = false
    @collection.save
    redirect_to admin_collections_path
  end

  # GET /collections/1/edit
  def edit
    render :layout => 'adminlte'
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)
    if @collection.title.nil? || @collection.title == ''
      redirect_to new_collection_path and return
    end
    respond_to do |format|
      if @collection.user_id == nil?
        @collection.user = current_user
      end
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
      if params[:collection_id]
        @collection = Collection.find(params[:collection_id])
      else
        @collection = Collection.find(params[:id])
      end
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

    def authorize
      if current_user.role == 0
        return
      end
      if @collection.user == current_user
        return
      end

      redirect_to collections_path
    end
end
