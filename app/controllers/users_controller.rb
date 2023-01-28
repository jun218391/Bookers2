class UsersController < ApplicationController
  
  
  def show
    # @book = Book.select("title", "body", "id")
    @user = User.find(params[:id])
    @books = @user.books
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
    @book = Book.new
    @user = current_user
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
