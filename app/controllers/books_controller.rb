class BooksController < ApplicationController
  # before_action :is_matching_login_user, only: [:edit, :update]
  # def new
  #   @book = Book.new
  # end
  
  def create
    @books =Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end
  
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id]) 
    @books = Book.new 
    @user = @book.user
    # @other_user = User.where.not(id: current_user.id)
    # @book.user = User.find(@book.user.id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to '/books'
    end
  end

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
