# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.limit(3)
  end

  def show
    @user = User.find(params[:id])
  end
end
