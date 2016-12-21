class UsersController < ApplicationController
  include SessionsHelper  

  def new
  	@user = User.new
  end

  def create
  	params.permit!
    @user = User.new(params[:user])
    if @user.save
      log_in(@user)
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to cookbooks_index_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end

end
