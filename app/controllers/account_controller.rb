class AccountController < ApplicationController
  layout "main_layout"
  
  def login
  end

  def submit_login
  end

  def home
  end

  def edit_gym_details
    @gym = Gym.find(@user[:id])
  end

  def update_gym_details
    if params[:confirm_password] == params[:gym][:password]
      @gym = Gym.find(@user[:id])
      params[:gym][:photo] = params[:photo]
      if @gym.update_attributes(params[:gym])
        flash.now[:notice] = "Gym details updated."
      else
        render :action => :edit_gym_details
      end
    else
      @gym = Gym.find(@user[:id])
      flash.now[:error] = "Please confirm your password!"
      render :action => :edit_gym_details
    end
  end

  def edit_fighter_record
    @fighters = Fighter.find(:all, :conditions => ["gym_id = ?",@user[:id]], :order => "wins DESC")
  end

  def update_fighter_record
    params[:update].each do |id,fighter|
      if Fighter.exists?(["gym_id = ? and id = ?",@user[:id], id])
        
        
        fighter[:experience] = case (fighter[:wins].to_i + fighter[:losses].to_i + fighter[:draws].to_i)
                  when 0..5
                    "5 or less fights"
                  when 6..10
                    "10 or less fights"
                  when 11..20
                    "20 or less fights"
                  when 20..89769797999898989989899879879
                    "20 or more fights"
                  end
                  
        Fighter.update(id, fighter)
      else
        flash.now[:error] = "You tried to change the details of a fighter that does not belong to your gym."
        break
      end
    end
    @user.update_attributes(:updated_on => Date.today)
    @fighters = Fighter.find(:all, :conditions => ["gym_id = ?",@user[:id]], :order => "wins DESC")
    flash.now[:notice] = "Fighter records updated."
  end
  
  def edit_fighter_details
    @fighter = Fighter.find(:first, :conditions => ["gym_id = ? and id = ?",@user[:id], params[:id]])
    if @fighter
      @rules = Rule.find(:all)
      @fighter_rules = []
      @fighter.rules.each do |rule|
        @fighter_rules.push rule[:id]
      end
    else
      flash[:error] = "That fighter does not belong to your gym."
      redirect_to :controller => :account, :action => :edit_fighter_record
    end
  end

  def update_fighter_details
    if Fighter.exists?(["gym_id = ? and id =?",@user[:id],params[:fighter_id]])
      @fighter = Fighter.find(params[:fighter_id])
      params[:fighter].each do |k,v|
        @fighter[k]  = v
      end
      if params[:disciplines]
        if @fighter.update_attributes(params[:fighter])
          @fighter.rules.delete_all
          params[:disciplines].each do |k,v|
            @fighter.rules << Rule.find(v)
          end
          @user.update_attributes(:updated_on => Date.today)
          flash[:notice] = "Fighter details updated.<Br/><br/><br/>#{params[:photo].inspect}"
          redirect_to :action => :edit_fighter_details, :id => @fighter[:id]
        else
          @rules = Rule.find(:all)
          @fighter_rules = []
          @fighter.rules.each do |rule|
            @fighter_rules.push rule[:id]
          end
          render :action => :edit_fighter_details, :id => @fighter[:id]
        end
      else
        @rules = Rule.find(:all)
        @fighter_rules = []
        @fighter.rules.each do |rule|
          @fighter_rules.push rule[:id]
        end
        flash.now[:error] = "You must choose at least one discipline."
        render :action => :edit_fighter_details, :id => @fighter[:id]
      end
    else
      flash[:error] = "That fighter does not belong to your gym."
      redirect_to :action => :edit_fighter_record
    end
  end
  
  def add_new_fighter
    @fighter = Fighter.new
    @rules = Rule.all
  end
  
  def submit_new_fighter
    if params[:disciplines] != nil and !params[:disciplines].empty?
      @fighter = Fighter.new(params[:fighter])
      @fighter[:gym_id] = @user[:id]
      @fighter[:experience] = case (@fighter[:wins].to_i + @fighter[:losses].to_i + @fighter[:draws].to_i)
        when 0..5
          "5 or less fights"
        when 6..10
          "10 or less fights"
        when 11..20
          "20 or less fights"
        when 20..89769797999898989989899879879
          "20 or more fights"
      end
      
      if @fighter.save
        params[:disciplines].each do |k,v|
          @fighter.rules << Rule.find(v)
        end
        flash.now[:notice] = "#{params[:fighter][:first_name]} #{params[:fighter][:last_name]} was added to the OzFighter database."
      else
        @rules = Rule.all
        render :action => :add_new_fighter
      end
    else
      @rules = Rule.all
      flash.now[:error] = "You must choose at least one discipline."
      render :action => :add_new_fighter
    end
  end

  def confirm_details_are_current
    @user.update_attributes(:updated_on => Date.today)
    flash.now[:notice] = "Confirmed that your gym and fighter details/records are up to date."
  end

end
