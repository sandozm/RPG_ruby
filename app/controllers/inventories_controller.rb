class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  def my_inventory
    @inventory = Character.find_by id: session[:character]
    @inventory = @inventory.items.where(:inventories => {:equip => 0})

    @equip_item = Character.find_by id: session[:character]
    @equip_item = @equip_item.items.where(:inventories => {:equip => 1})
  end

  def add_to_inventory
    if request.post?
      inventory = Inventory.where(character_id: session[:character], id: params[:id]).first
      

      item = Item.where(:id => inventory.item_id).first

      inv = Character.find_by id: session[:character]
      inv = inv.items.where(:slot => item.slot ,:inventories => {:equip => 1}).first
      if !inv.nil?
        t_item = Inventory.where(:item_id => inv.id, character_id: session[:character]).first
      end

      if !t_item.nil?
        t_item.equip = 0
        t_item.save
      end
      inventory.equip = 1
      inventory.save
      redirect_to({ :controller => 'inventories', :action => 'my_inventory' }, :notice => 'Equipement mis à jour!')
    end
  end

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:character_id, :item_id)
    end
end
