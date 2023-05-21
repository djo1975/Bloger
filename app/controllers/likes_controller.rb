class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @current_user.likes.new(post_id: @post.id)

    if @like.save
      render partial: 'likes/like', locals: { post: @post }
    else
      redirect_to @post, alert: 'Failed to add like.'
    end
  end
end
