class UsersController < ApplicationController
  def index
  end

  def show
    @book = Book.new
    @book = Book.all
  end

  def edit
  end

  def update
  end

  def top
  end
end
