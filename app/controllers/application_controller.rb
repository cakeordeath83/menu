class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_retailer
  
  def current_retailer
    @_current_retailer ||= Retailer.find(session[:retailer_id]) if session[:retailer_id]
  end
  
  def require_retailer
    redirect_to '/login' unless current_retailer
  end
  
end
