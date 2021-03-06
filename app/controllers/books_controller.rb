class BooksController < ApplicationController

   before_action :authenticate_user!
   before_action :corrent_user, only: [:edit, :update]

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book_id = Book.find(params[:id])
    @user = User.find(@book_id.user.id)
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book)
    else
      @user = current_user
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
      flash[:notice] = "You have updated book successfully."
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

  def corrent_user
      book = Book.find(params[:id])
      if current_user.id != book.user_id
        redirect_to books_path
      end
    end
end
