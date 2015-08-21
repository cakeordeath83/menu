class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show, :edit, :update, :destroy]
  before_action :require_retailer, only: [:edit, :update, :destroy]

  # GET /retailers
  # GET /retailers.json
  def index
    @retailers = Retailer.all
  end

  # GET /retailers/1
  # GET /retailers/1.json
  def show
  end

  # GET /retailers/new
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
         redirect_to @retailer
       else
         
         redirect_to signup_path
       end
  end

  # PATCH/PUT /retailers/1
  # PATCH/PUT /retailers/1.json
  def update
    respond_to do |format|
      if @retailer.update(retailer_params)
        format.html { redirect_to @retailer, notice: 'Retailer was successfully updated.' }
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
      format.html { redirect_to retailers_url, notice: 'Retailer was successfully destroyed.' }
      format.json { head :no_content }
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
end
