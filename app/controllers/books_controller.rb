class BooksController < ApplicationController
  # 一覧、新規投稿
  def index
    @book = Book.new
    @books = Book.all
  end
  # 詳細
  def show
    
  end
  # 保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
