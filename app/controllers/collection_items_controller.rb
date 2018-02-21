class CollectionItemsController < ApplicationController
  before_action :set_collection_item, only: [:show, :edit, :update, :destroy]
  before_action :set_collection
  layout 'adminlte'
  # GET /collection_items
  # GET /collection_items.json
  def index
    if params[:collection_id]
      @collection_items = Collection.find(params[:collection_id]).collection_items
    else
      @collection_items = CollectionItem.all
    end
  end

  # GET /collection_items/1
  # GET /collection_items/1.json
  def show
    render :layout => 'khaki'
  end

  # GET /collection_items/new
  def new
    @collection_item = CollectionItem.new
  end

  # GET /collection_items/1/edit
  def edit
  end

  # POST /collection_items
  # POST /collection_items.json
  def create
    @collection_item = CollectionItem.new(collection_item_params)
    respond_to do |format|
      if @collection_item.file.file.nil? && @collection_item.video.file.nil?
        byebug
        format.html { render :new }
      else
        if @collection_item.save
          format.html { redirect_to @collection, notice: 'Collection item was successfully created.' }
          format.json { render :show, status: :created, location: @collection_item }
        else
          format.html { render :new }
          format.json { render json: @collection_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /collection_items/1
  # PATCH/PUT /collection_items/1.json
  def update
    respond_to do |format|
      if @collection_item.update(collection_item_params)
        format.html { redirect_to @collection_item, notice: 'Collection item was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_item }
      else
        format.html { render :edit }
        format.json { render json: @collection_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_items/1
  # DELETE /collection_items/1.json
  def destroy
    @collection = @collection_item.collection
    @collection_item.destroy
    respond_to do |format|
      format.html { redirect_to edit_collection_path(@collection), notice: 'Collection item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    set_collection_item
    data = open(@collection_item.file.url)
    send_data data.read, filename: @collection_item.file.instance_variable_get('@file').filename,  disposition: 'attach', stream: 'true', buffer_size: '4096'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_item
      @collection_item = CollectionItem.find(params[:id])
    end

    def set_collection
      unless params[:collection_id].nil?
        @collection = Collection.find(params[:collection_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_item_params
      params.require(:collection_item).permit(:user_id, :collection_id, :file, :video, :item_type)
    end
end
