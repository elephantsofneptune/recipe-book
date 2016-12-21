class CookbooksController < ApplicationController

  def index
    if current_user.the_pretty_admin?
      @cookbooks = Cookbook.all
    else
  	 @cookbooks = Cookbook.where(user_id: current_user.id)
    end
  end

  def new
  	@cookbook = Cookbook.new
  end

  def create
  	params.permit!
  	@cookbook = Cookbook.create(user_id: current_user.id)
  	@cookbook.update(params[:cookbook])
  	redirect_to cookbooks_path
  end

  def show
  	@cookbook = Cookbook.find(params[:id])
  end

  def edit
  	@cookbook = Cookbook.find(params[:id])
  end

  def update
  	params.permit!
  	@cookbook = Cookbook.find(params[:id])
  	@cookbook.update(params[:cookbook])
  	redirect_to cookbooks_path  	
  end

  def destroy
  	Cookbook.find(params[:id]).destroy
  	redirect_to cookbooks_path
  end
end
