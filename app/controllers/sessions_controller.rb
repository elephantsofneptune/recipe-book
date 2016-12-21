class SessionsController < ApplicationController
  include SessionsHelper  

  def new
  end

  def create
    if User.from_omniauth(env["omniauth.auth"]) != nil
      user = User.from_omniauth(env["omniauth.auth"])
      log_in user
      redirect_to cookbooks_path
    else
    	if User.find_by(email: params[:session][:username_email]) != nil
    		user = 	User.find_by(email: params[:session][:username_email])
    	elsif User.find_by(username: params[:session][:username_email]) != nil
    		user = 	User.find_by(username: params[:session][:username_email])
    	else
    		flash[:danger] = "Username / email does not exist in our database"
    		redirect_to login_path and return
    	end
    	if user && user.authenticate(params[:session][:password])
    	  log_in user
    	  redirect_to cookbooks_path
    	else
    	  flash[:danger] = 'Invalid username / email and password combination'
    	  redirect_to login_path and return
    	end
    end
  end

  def destroy
    log_out
    redirect_to root_path  	
  end
end
