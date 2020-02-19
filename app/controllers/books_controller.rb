class BooksController < ApplicationController

   before_action :authenticate_user!

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(carrent_user)
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
