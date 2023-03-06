class SubscriptionsController < ApplicationController
    before_action :authenticate_user!

    def create
        @subscription = Subscription.new(subscription_params)
        @subscription.user_id = current_user.id
        if @subscription.save
            redirect_back(fallback_location: root_path) # redirect to the community thats subbed to
        end
    end

    def destroy
        @subscription = Subscription.find_by_id(params[:id])
        @subscription.destroy
        redirect_back(fallback_location: root_path) # redirect to the community thats subbed to
    end

    def subscription_params
        params.require(:subscription).permit(:community_id)
    end
end
