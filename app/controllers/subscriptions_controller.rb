class SubscriptionsController < ApplicationController
  def create
  	@subscription = Subscription.create(user_id: current_user.id, cookbook_id: params[:cookbook_id])
  	redirect_to cookbook_path(Cookbook.find(params[:cookbook_id]))
  end

  def destroy
  	Subscription.find_by(user_id: params[:user_id], cookbook_id: params[:cookbook_id]).destroy
  	redirect_to cookbook_path(Cookbook.find(params[:cookbook_id]))
  end
end
