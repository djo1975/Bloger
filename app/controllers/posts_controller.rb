class PostsController < ApplicationController
  include WillPaginate::ViewHelpers

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.includes(:author).paginate(page: params[:page], per_page: 10)
    @comments_count = @post.comments.count
    @likes_count = @post.likes.size
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def new
    @user = User.find(1) # Pronalazak korisnika sa ID-om 1
    @post = @user.posts.build
  end

  def like
    @post = Post.find(params[:id])
    Like.create(post: @post, author: current_user)

    respond_to(&:js)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
