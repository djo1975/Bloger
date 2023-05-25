# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.limit(3)
  end

  def show
    if params[:id] == "sign_out"
      # Logika za odjavu korisnika
      # Na primer, ako koristite Devise:
      sign_out(current_user)
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end
  
end
