class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    Rails.logger.debug("Post ID: #{@post_id}") # Logging statement
    Rails.logger.debug("Comment Params: #{comment_params}") # Logging statement
    Rails.logger.debug("Current User ID: #{current_user.id}") # Logging statement

    if @comment.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id), notice: 'Comment was successfully created.'
    else
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id), alert: 'Comment could not be saved.'
    end
  end

  def new
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
