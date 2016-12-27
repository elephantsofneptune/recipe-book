class CookbooksController < ApplicationController

  def index
    if params[:view] == "all" || current_user.the_admin?
      @status = "all" if params[:view] == "all"
      @cookbooks = Cookbook.all.public_entry.page(params[:page]).order('created_at DESC')
    else
  	 @cookbooks = Cookbook.where(user_id: current_user.id).page(params[:page]).order('created_at DESC')
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
    @recipes = Recipe.where(:cookbook_id => params[:id]).page(params[:page]).order('created_at DESC')
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
    respond_to do |format|
      format.html { redirect_to cookbooks_path }
      format.json { head :no_content }
      format.js   { render :nothing => true }
    end
  end
end
