class UsersController < ApplicationController
  
   before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(params[:id])
    @book = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def top
  end


end
