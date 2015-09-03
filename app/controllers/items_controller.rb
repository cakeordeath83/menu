class ItemsController < ApplicationController
  before_action :find_retailer
  before_action :find_item, only: [:show, :update, :destroy, :edit]
   
  def index
  end

  def show
    
  end

  
  def new
    @item = @retailer.items.new
  end

  def edit
    
  end

  def create
    @item = @retailer.items.new(item_params)

    respond_to do |format|
      if @item.save
        # May need to sort the @item part to retailer_item_path
        format.html { redirect_to retailer_items_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to retailer_items_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    @item.destroy
    respond_to do |format|
      format.html { redirect_to retailer_items_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
  
    def find_retailer
      @retailer = Retailer.find(params[:retailer_id])
    end
  
    def find_item
      @item = @retailer.items.find(params[:id])
    end
  
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :category, :retailer_id)
    end
end
