class UsersController < ApplicationController
  include SessionsHelper  

  def new
  	@user = User.new
  end

  def create
  	params.permit!
    @user = User.new(params[:user])
    @user.avatar = "http://www.librarything.com/wiki/images/3/34/Book-cover-black.jpg"
    if @user.save
      log_in(@user)
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to cookbooks_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    params.permit!
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

end
