class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
        @like = Like.new(like_params)
        @like.user_id = current_user.id
        if @like.save
            redirect_back(fallback_location: root_path) # redirect to the page of the likeable thats liked
        end
    end

    def destroy
        @like = Like.find_by_id(params[:id])
        @like.destroy
        redirect_back(fallback_location: root_path) # redirect to the page of the likeable thats liked
    end

    def like_params
        params.require(:like).permit(:community_id, :likeable_id, :likeable_type)
    end
end
