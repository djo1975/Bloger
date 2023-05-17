class PostsController < ApplicationController
  include WillPaginate::ViewHelpers

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.includes(:author).paginate(page: params[:page], per_page: 10)
    @comments_count = @post.comments.count
    @likes_count = @post.likes.size
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
