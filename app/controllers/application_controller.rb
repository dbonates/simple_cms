class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def confirm_logged_in
    
    unless session[:user_id]
      flash[:notice] = "Please Login primeiro."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_filter
    else
      return true
    end
    
  end
  
end
