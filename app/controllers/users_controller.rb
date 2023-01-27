class UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    # render template: 'books/create'
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id= current_user.id
    # if @book.save
      redirect_to books_path(book.id)
    # else
      # render new
    # end
  end
  
  def index
    @users = User.all
    @book = Book.new(book_params)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
     
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
end
