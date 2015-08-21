class SessionsController < ApplicationController
  def new
  end
  
  def create
    @retailer = Retailer.find_by(email: params[:session][:email])
    respond_to do |format|
    if @retailer && @retailer.authenticate(params[:session][:password])
      
      session[:retailer_id] = @retailer.id
      
      format.html { redirect_to retailer_path(@retailer), notice: 'Retailer was successfully logged in.' }
        
      
    else
      redirect_to login_path
    end
    end
  end
  
  def destroy
    session[:retailer_id] = nil
    redirect_to '/'
  end
  
end
