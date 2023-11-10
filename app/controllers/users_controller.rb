class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @users = User.all
    @user_found = current_user
    @book = Book.new
  end

  def show
    @user_found = User.find(params[:id])
    @books = @user_found.books
    @book = Book.new
  end
  
  def edit
    @user_found = User.find(params[:id])
  end
  
  def update
    @user_found = User.find(params[:id])
    if @user_found.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user_found)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
end




