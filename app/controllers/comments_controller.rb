class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @community = Community.find(params[:community_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post_id = params[:post_id]
        @comment.community_id = params[:community_id]

        if @comment.save
            redirect_to community_post_path(Community.find_by_id(@comment.community_id), Post.find_by_id(@comment.post_id))
            flash[:message] = 'Comment created successfully'
        else
            render 'new'
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        community = @comment.community_id
        post = @comment.post_id
        @comment.destroy
        redirect_back(fallback_location: root_path)
        flash[:message] = 'Comment deleted successfully'
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :parent_id)
    end
end
  