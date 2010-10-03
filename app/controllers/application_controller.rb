# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
protected  
  def logged_in?
    !!session[:logged_in]
  end
    
  def login_required
    redirect_to root_url unless logged_in?
  end
end
