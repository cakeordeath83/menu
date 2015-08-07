class ItemsController < ApplicationController
  before_action :find_retailer

  
  def index
  end

  def show
    @item = @retailer.items.find(params[:id])
  end

  
  def new
    @item = @retailer.items.new
  end

  def edit
    @item = @retailer.items.find(params[:id])
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
    @item = @retailer.items.find(params[:id])
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
    @item = @retailer.items.find(params[:id])
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :category, :retailer_id)
    end
end
