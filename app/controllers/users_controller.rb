class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
end
