class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book)
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
