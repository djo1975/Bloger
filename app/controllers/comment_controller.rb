class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id), notice: 'Comment was successfully created.'
    else
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id), alert: 'Comment could not be saved.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
