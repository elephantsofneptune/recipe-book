class SubscriptionsController < ApplicationController
  def create
  	@subscription = Subscription.create(user_id: current_user.id, cookbook_id: params[:cookbook_id])
  	respond_to do |f|
	    f.html { redirect_to cookbooks_path }
	    f.js
  	end
  end

  def destroy
  	subscribed = Subscription.find_by(user_id: current_user.id, cookbook_id: params[:cookbook_id])
  	subscribed.destroy
  	respond_to do |f|
	    f.html { redirect_to cookbooks_path }
	    f.js
  	end
  end
end
