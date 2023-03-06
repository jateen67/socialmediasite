class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @user = "#{User.find_by_id(@post.user_id).username}"
    end

    def new
        @community = Community.find(params[:community_id]) # getting the community itself to put the new post into
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.community_id = params[:community_id] # getting community by the id of the community that nests the post (which is the param)
        if @post.save
            redirect_to community_post_path(@post.community_id, @post)
            flash[:message] = 'Post created successfully'
        else
            render 'new'
        end
    end

    def edit
        @community = Community.find(params[:community_id])
        @post = Post.find(params[:id])
    end

    def update
        community = Community.find(params[:community_id])
        post = Post.find(params[:id])
        post.update!(post_params)
        redirect_to community_post_path(community, post)
        flash[:message] = 'Post updated successfully'
    end

    def destroy
        @post = Post.find(params[:id])
        community = @post.community_id
        @post.destroy
        redirect_to community_path(community)
        flash[:message] = 'Post deleted successfully'
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
  