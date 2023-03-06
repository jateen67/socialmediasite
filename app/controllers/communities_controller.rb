class CommunitiesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @communities = Community.all
    end

    def show
        @community = Community.find(params[:id])
        @posts = @community.posts # not including this will cause null error in communities shoe.html.erb when looping over posts
        @user = "#{User.find_by_id(@community.user_id).username}"
    end

    def new
        @community = Community.new
    end

    def create
        @community = Community.new(community_params)
        @community.user_id = current_user.id
        if @community.save
            redirect_to community_path(@community)
            flash[:message] = 'Community created successfully'
        else
            render 'new'
        end
    end
    
    def edit
        @community = Community.find(params[:id])
    end

    def update
        community = Community.find(params[:id])
        community.update!(community_params)
        redirect_to community_path(community)
        flash[:message] = 'Community updated successfully'
    end

    def destroy
        @community = Community.find(params[:id])
        @community.destroy
        redirect_to communities_path
        flash[:message] = 'Community deleted successfully'
    end

    private
    def community_params
        params.require(:community).permit(:title, :rules, :description)
    end
end
  