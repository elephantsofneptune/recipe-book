class SubscriptionsController < ApplicationController
  def create
  	@subscription = Subscription.create(user_id: current_user.id, cookbook_id: params[:cookbook_id])
  respond_to do |format|
      if @subscription.save
        format.html { redirect_to cookbook_path(params[cookbook_id]) }
        format.js   {}
        format.json { render json: @subscription, status: :created }
      else
        format.html { redirect_to cookbook_path(params[cookbook_id]) }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def test
    @subscription = User.where(id: Subscription.last.user_id)
    respond_to do |format|
        format.html { redirect_to cookbooks_path }
        format.js   {}
        format.json { render json: @subscription, status: :created }
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
