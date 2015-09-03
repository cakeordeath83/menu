class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_retailer
  helper_method :correct_retailer
  
  def current_retailer
    Retailer.find(session[:retailer_id]) if session[:retailer_id]
  end
  
  def require_retailer
    redirect_to '/login' unless current_retailer
    
  end
  
  def correct_retailer
    @retailer = Retailer.find(params[:id])
    if @retailer != current_retailer
      respond_to do |format|
      format.html { redirect_to retailers_path, notice: "Sorry, you can't do that." }
      end
    end
  end
  
  
end
