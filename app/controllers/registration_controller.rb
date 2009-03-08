class RegistrationController < ApplicationController
  layout "main_layout"
  
  def form
    @gym = Gym.new
  end

  def create
    if params[:gym]
      @gym = Gym.new(params[:gym])
      alpha = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
      activation_code = [rand(10),rand(100),rand(6),rand(9), rand(10), rand(10), alpha[rand(25)], rand(100),rand(20),rand(8),rand(10),alpha[rand(25)],alpha[rand(25)],alpha[rand(25)]].join("")
      @gym[:activation_code] = activation_code
      @gym[:ip] = request.env['REMOTE_HOST']

      if @gym.save
        logger.info "#{Time.now.day}/#{Time.now.month}/#{Time.now.year} - Gym Name: #{@gym[:name]}, Gym ID: #{@gym[:id]}, IP: #{request.env['REMOTE_HOST']}"
        redirect_to :action => :confirm, :id => @gym[:id]
      else
        flash.now[:error] = "Your account registration failed for some reason. Please send an email to witt@ozfighters.com.au to try and fix the problem."
        render :action => :form
      end
    else
      flash[:error] = "Please complete all details before submitting the form."
      redirect_to :action => :form
    end
  end

  def confirm
    if Gym.exists?(params[:id])
      @gym = Gym.find(params[:id])
      Mailer.deliver_signup_confirmation(@gym)
      flash.now[:notice] = "A confirmation email has been sent to #{@gym[:email]}. Please follow instructions in this email to activate your new gym account. <br/><br/>Due to different junk mail settings, the email may have been sent to your junk mail box so please remember to check there as well if it doesn't show up in your inbox (this sometimes happens with hotmail accounts)."
    else
      redirect_to :action => :form      
    end
  end
  
  def activate
    if @gym = Gym.exists?(params[:id]) and params[:activation_code]
      @gym = Gym.find(params[:id])
      if @gym[:activation_code] == params[:activation_code]
        Gym.update(@gym[:id], {:activated => true})
        gym_link = "<a href=\"/main/gym/#{@gym[:id]}\">#{@gym[:name]}</a>"
        News.create(:message => "#{gym_link} is now a part of the Oz Fighter database!")
        flash.now[:notice] = "Thanks #{@gym[:first_name].capitalize}, your gym account has now been activated. You can now log in and add fighter details."
      else
        flash.now[:error] = "Account activation failed. Please try again."
      end
    else
      flash.now[:error] = "Account activation failed. Please try again."
    end
  end

end
