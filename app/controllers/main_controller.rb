class MainController < ApplicationController
  
  layout "main_layout"
  
  def index
  end
  
  def send_email
    if Mailer.deliver_test
      flash.now[:notice] = "success"
    else
      flash.now[:error] = "failure"
    end
  end
  
  def gym_login
  end
  
  def login
    @user = Gym.find(:first,:conditions => ["login_id = ? and password = ? and activated = ?",params[:login_id],params[:password],true])
    if @user
      session[:user] = @user[:id]
      flash.now[:notice] = "You are now logged in as #{@user.name}."
    else
      flash.now[:error] = "Incorrect login ID or password."
    end
  end
  
  def logout
    session[:user] = nil
    flash[:notice] = "Successfully logged out of your account."
    redirect_to :action => :index
  end



  def fighter
    if Fighter.exists?(params[:id])
      @fighter = Fighter.find(params[:id])
    else
      flash[:error] = "Could not find information on that fighter."
      redirect_to :action => :error      
    end
  end

  def gym
    if Gym.exists?(params[:id])
      @gym = Gym.find(params[:id])
    else
      flash[:error] = "Could not find information on that gym."
      redirect_to :action => :error
    end
  end

  def search
  end
  
  
  def fighter_name_search
    if params[:perform_name_search]
      fighter_name = params[:name_search]
    else
      fighter_name = params[:name]
    end    
    if !fighter_name.nil? and fighter_name != ""
      @fighters = Fighter.find(:all,:conditions => ["first_name LIKE ? or last_name LIKE ? or ring_name LIKE ?","%#{fighter_name}%","%#{fighter_name}%","%#{fighter_name}%"])
    else
      @fighters = {}
    end
    if !params[:perform_name_search]
      render :partial => "fighter_name_search_pane"
    end
  end

  def fighter_gym_search
    if params[:perform_gym_search]
      gym_name = params[:gymsearch]
    else
      gym_name = params[:gym]
    end
    if !gym_name.nil? and gym_name != ""
      @gyms = Gym.find(:all,:conditions => ["(name LIKE ? or last_name LIKE ? or first_name LIKE ? or (first_name+\" \"+last_name) LIKE ?) and activated = ?","%#{gym_name}%","%#{gym_name}%","%#{gym_name}%","%#{gym_name}%",true])
    else
      @gyms = {}
    end
    if !params[:perform_gym_search]
      render :partial => "fighter_gym_search_pane"
    end
  end

  def search
    criteria = params[:criteria]
    sql_query = []
    sql_input = []
    
    if criteria[:gender] != "all" 
      sql_query.push "gender = ?" 
      sql_input.push criteria[:gender]
    end
    
    if criteria[:weight] != "all" 
      sql_query.push "min_weight <= ? and max_weight >= ?" 
      sql_input.push criteria[:weight] 
      sql_input.push criteria[:weight] 
    end
    
    if criteria[:experience] != "all" 
      sql_query.push "experience = ?"
      sql_input.push criteria[:experience]
    end
    
    if criteria[:state] != "all" 
      sql_query.push "state = ?"
      sql_input.push criteria[:state]
    end
    
    if criteria[:gym] != "all" 
      sql_query.push "gym_id = ?"
      sql_input.push criteria[:gym]
    end
    
    sql_input.insert(0,sql_query.join(" and "))
    
    @sql = sql_input
    
    #render :text => @sql.inspect and return false
    
    if criteria[:discipline] != "all"  #If someone has selected to search with discipline filter, then need to do it this way because of associations. Rules has_and_belongs_to_many fighters, etc.
      rules = Rule.find(:first, :conditions => ["discipline = ?",criteria[:discipline]]) 
      if sql_input = [""]
        @fighters = rules.fighters.all
        flash.now[:notice] = "A"
      else
        @fighters = rules.fighters.find(:all,:conditions => sql_input, :joins => [:gym])
        flash.now[:notice] = "B"
      end
    else
      if sql_input = [""]
        @fighters = Fighter.find(:all)
      else
        flash.now[:notice] = "C"
        @fighters = Fighter.find(:all,:conditions => sql_input, :joins => [:gym])
      end
    end
  end

  def featured_gym
  end

  def featured_fighter
  end

  def rankings
  end

  def contact
  end
  
  def error
  end

end
