class BooksController < ApplicationController
  # 一覧、新規投稿
  def index
    @new_book = Book.new
    @books = Book.all
    @book_found = Book.first
    @user_found = @book_found.user
  end
  # 詳細
  def show
    @book_found = Book.find(params[:id])
    @user_found = @book_found.user
    @new_book = Book.new
  end
  # 保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  # 編集
  def edit
    @book_found = Book.find(params[:id])
  end
  # 更新
  def update
    @book_found = Book.find(params[:id])
    @book_found.update(book_params)
    redirect_to book_path(@book_found.id)
  end
  # 削除
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end







