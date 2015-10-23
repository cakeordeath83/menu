class SessionsController < ApplicationController
  def new
  end
  
  def create
    @retailer = Retailer.find_by(email: params[:session][:email])
     if @retailer && @retailer.authenticate(params[:session][:password])
      session[:retailer_id] = @retailer.id
      flash[:notice] = "Welcome #{@retailer.name}!"
      redirect_to retailer_items_path(@retailer)
     else
      redirect_to login_path
     end
  end
  
  def destroy
    session[:retailer_id] = nil
    redirect_to '/'
  end
  
end
