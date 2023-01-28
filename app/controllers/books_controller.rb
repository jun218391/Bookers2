class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book.id)
    else
      render :new
    end
  end
  
  def index
    @books = Book.all
    @user = User.new
    @user.id = current_user.id
    # @user.id = current_user.id
    # @book = Book.select("title", "body", "id")
    # @user = User.select("id")
    
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to books_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/"
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
