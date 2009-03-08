# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  before_filter :get_info

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'ac7df1289c7a67a8dc2e783d05c3405c'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  # auto_complete_for :fighter, :contains
  
  private
  
  def title title
    @title = title
  end

  def get_info
    @news = News.find(:all,:order => "created_at DESC") 
    @gym_list = Gym.find(:all,:order => "name ASC") 
    @rules_list = Rule.find(:all)
    if session[:user]
      @user = Gym.find(session[:user])
    end
  end
  
  
  
end
