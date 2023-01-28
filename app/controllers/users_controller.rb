class UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
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
    @book = Book.new
    @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path(@user)
    end
  end
  
  def update
    user_id = params[:id].to_i
     unless user_id == current_user.id
      redirect_to user_path(@user)
     end
    
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
