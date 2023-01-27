class UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    @users = User.all
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
