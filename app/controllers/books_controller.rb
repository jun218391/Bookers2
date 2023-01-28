class BooksController < ApplicationController
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
    @book = Book.find(params[:id])  #urlのidを持つbookのデータを＠bookに収納
    @books = Book.new #新規投稿機能のため
    @user = @book.user#bookから関連づけられたuser情報を＠userに収納
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

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
