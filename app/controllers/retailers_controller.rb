class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show, :edit, :update, :destroy]
  before_action :require_retailer, only: [:edit, :update, :destroy]
  before_action :correct_retailer, only: [:edit, :update]
  
  
  def index
    
    if postcode_given == true
      @retailers = Retailer.near(params[:search], 0.25)
      if @retailers.empty?
        redirect_to no_results_path
      end
    elsif params[:search]
      @retailers = Retailer.search(params[:search])
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

  # GET /retailers/1/edit
  def edit
  end

  # POST /retailers
  # POST /retailers.json
  def create
    @retailer = Retailer.new(retailer_params)
       if @retailer.save
         session[:retailer_id] = @retailer.id
         redirect_to retailer_items_path(@retailer)
       else
         
         render :new
       end
  end

  # PATCH/PUT /retailers/1
  # PATCH/PUT /retailers/1.json
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

  # DELETE /retailers/1
  # DELETE /retailers/1.json
  def destroy
    @retailer.destroy
    respond_to do |format|
      format.html { redirect_to retailers_url, flash: 'Retailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # Codebar - doesn't seem to work in view
  def postcode_given
    if params[:search] =~ /^(([gG][iI][rR] {0,}0[aA]{2})|((([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y]?[0-9][0-9]?)|(([a-pr-uwyzA-PR-UWYZ][0-9][a-hjkstuwA-HJKSTUW])|([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y][0-9][abehmnprv-yABEHMNPRV-Y]))) {0,}[0-9][abd-hjlnp-uw-zABD-HJLNP-UW-Z]{2}))$/
      true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
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
