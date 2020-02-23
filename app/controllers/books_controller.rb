class BooksController < ApplicationController

   before_action :authenticate_user!

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book_id = Book.find(params[:id])
    @user = current_user
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = "You have created book successfully"
    else
      @books = Book.all
      render action: :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    if
      book.update(book_params)
      redirect_to book_path(params[:id])
    else
      @book = book
      render action: :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end

end
