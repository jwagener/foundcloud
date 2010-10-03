module Admin
  class AdminController < ApplicationController
    layout 'admin'
    
    before_filter :login_required, :except => [:login]
    
    SECRET='SUPERSECRET'
    
    def login
      if params[:secret] == SECRET 
        session[:logged_in] = true 
        redirect_to tags_path
      else
        render :text => 'nope'
      end
    end
    
    def logout
      session[:logged_in] = false
      redirect_to root_path
    end
  end
end