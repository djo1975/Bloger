class LikesController < ApplicationController
  def create
    @post = Post.includes(:likes).find(params[:post_id])
    @like = current_user.likes.new(post: @post)

    if @like.save
      render partial: 'likes/like', locals: { post: @post }
    else
      redirect_to @post, alert: 'Failed to add like.'
    end
  end
end
