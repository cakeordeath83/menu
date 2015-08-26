class SessionsController < ApplicationController
  def new
  end
  
  def create
    @retailer = Retailer.find_by(email: params[:session][:email])

    #binding.pry
    
    if @retailer && @retailer.authenticate(params[:session][:password])
      
      session[:retailer_id] = @retailer.id
      
      redirect_to retailer_path(@retailer), notice: 'Retailer was successfully logged in.'
        
      
    else
      redirect_to login_path
    end
    
  end
  
  def destroy
    session[:retailer_id] = nil
    redirect_to '/'
  end
  
end
