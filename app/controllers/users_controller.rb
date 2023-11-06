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
    @user = User.find(params[:id])
  end
end
