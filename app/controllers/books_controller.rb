class BooksController < ApplicationController

   before_action :authenticate_user!

  def index
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.find(params[:id])
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

end
