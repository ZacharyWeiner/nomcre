class ShotListItemsController < ApplicationController
  before_action :set_shot_list_item, only: [:show, :edit, :update, :destroy]
  layout 'black_dashboard'
  # GET /shot_list_items
  # GET /shot_list_items.json
  def index
    if params[:proposal_id]
      @shot_list_items = ShotListItem.where(proposal_id: params[:proposal_id])
    else
      @shot_list_items = ShotListItem.all
    end
  end

  # GET /shot_list_items/1
  # GET /shot_list_items/1.json
  def show
  end

  # GET /shot_list_items/new
  def new
    @shot_list_item = ShotListItem.new
    if params[:proposal_id]
      @proposal = Proposal.find(params[:proposal_id])
    end
  end

  # GET /shot_list_items/1/edit
  def edit
    if params[:proposal_id]
      @proposal = Proposal.find(params[:proposal_id])
    end
  end

  # POST /shot_list_items
  # POST /shot_list_items.json
  def create

    @shot_list_item = ShotListItem.new(shot_list_item_params)
    can_add = true
    if shot_list_item_params[:shoot_id]
      shoot = Shoot.find(shot_list_item_params[:shoot_id])
      can_add = shoot.owner_added_shot_list_count <= 8
    end
    respond_to do |format|
      if @shot_list_item.description.nil? || @shot_list_item.description == ""
        format.html { redirect_to proposal_shot_list_items_path(@shot_list_item.proposal), notice: 'Description is required'}
      elsif !can_add
        format.html { redirect_to shoot_path(@shot_list_item.shoot, :active => 'shotlist'), notice: 'Youve already added as many shots as you can.'}
      elsif@shot_list_item.save
        if !@shot_list_item.proposal.nil?
          format.html { redirect_to proposal_path(@shot_list_item.proposal, :active => 'shotlist'), notice: 'Shot list item was successfully created.' }
          format.json { render :show, status: :created, location: @shot_list_item }
        elsif !@shot_list_item.shoot.nil?
          format.html { redirect_to shoot_path(@shot_list_item.shoot, :active => 'shotlist'), notice: 'Shot list item was successfully created.' }
          format.json { render :show, status: :created, location: @shot_list_item }
        else
          format.html { redirect_to shot_list_item_path(@shot_list_item), notice: 'Shot list item was successfully created.' }
          format.json { render :show, status: :created, location: @shot_list_item }
        end
      else
        format.html { render :new }
        format.json { render json: @shot_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shot_list_items/1
  # PATCH/PUT /shot_list_items/1.json
  def update
    respond_to do |format|
      if @shot_list_item.update(shot_list_item_params)
         if !@shot_list_item.proposal.nil?
          format.html { redirect_to proposal_path(@shot_list_item.proposal, :active => 'shotlist'), notice: 'Shot list item was successfully updated.' }
          format.json { render :show, status: :created, location: @shot_list_item }
        elsif !@shot_list_item.shoot.nil?
          format.html { redirect_to shoot_path(@shot_list_item.shoot, :active => 'shotlist'), notice: 'Shot list item was successfully updated.' }
          format.json { render :show, status: :created, location: @shot_list_item }
        else
          format.html { redirect_to shot_list_item_path(@shot_list_item), notice: 'Shot list item was successfully updated.' }
          format.json { render :show, status: :created, location: @shot_list_item }
        end
      else
        format.html { render :edit }
        format.json { render json: @shot_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shot_list_items/1
  # DELETE /shot_list_items/1.json
  def destroy
    @proposal = @shot_list_item.proposal
    @shot_list_item.destroy
    respond_to do |format|
      format.html { redirect_to proposal_shot_list_items_path(@proposal), notice: 'Shot list item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot_list_item
      @shot_list_item = ShotListItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shot_list_item_params
      params.require(:shot_list_item).permit(:proposal_id, :description, :background, :upload, :item_type, :task_id, :focus_point, :aspect_ratio, :reference_image, :shoot_id, :added_by_id)
    end

end
