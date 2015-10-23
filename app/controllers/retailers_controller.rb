class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show, :edit, :update, :destroy]
  before_action :require_retailer, only: [:edit, :update, :destroy]
  before_action :correct_retailer, only: [:edit, :update]
  
  
  def index
    if params[:postcode]
      @retailers = Retailer.near(params[:postcode], 0.25)
      if @retailers.empty?
				redirect_to no_postcode_path
      end
    elsif params[:search]
      @retailers = Retailer.search(params[:search])
      @search = params[:search]
      if @retailers.empty?
				redirect_to no_results_path
      end
    elsif params[:category]
      @retailers = Retailer.joins(:items).where(items: {category_id: params[:category][:category_id]}).uniq
    else
      @retailers = Retailer.all.sort_by{|r| r.name}
    end
  end

	
	
  def show
  end

  def new
    @retailer = Retailer.new
  end

  def edit
  end

  def create
    @retailer = Retailer.new(retailer_params)
       if @retailer.save
         session[:retailer_id] = @retailer.id
         redirect_to retailer_items_path(@retailer)
       else
         render :new
       end
  end

 def update
    respond_to do |format|
      if @retailer.update(retailer_params)
        format.html { redirect_to retailer_items_path(@retailer), notice: 'Your details were successfully updated.' }
        format.json { render :show, status: :ok, location: @retailer }
      else
        format.html { render :edit }
        format.json { render json: @retailer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @retailer.destroy
    respond_to do |format|
      format.html { redirect_to retailers_url, flash: 'Retailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
   
private
    
    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retailer_params
      params.require(:retailer).permit(:name, :address, :address2, :address3, :city, :postcode, :email, :openinghours, :description, :password, :password_confimation, :asset)
    end
  
    def correct_retailer
      @retailer = Retailer.find(params[:id])
      if @retailer != current_retailer
        respond_to do |format|
        format.html { redirect_to retailers_path, flash: "Sorry, you can't do that." }
        end
      end
    end

    def current_retailer
      Retailer.find(session[:retailer_id]) if session[:retailer_id]
      end
    end
