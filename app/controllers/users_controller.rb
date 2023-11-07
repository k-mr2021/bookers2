class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
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
    @user_found.update(user_params)
    redirect_to user_path(@user_found)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end

