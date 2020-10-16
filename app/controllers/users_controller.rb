class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
