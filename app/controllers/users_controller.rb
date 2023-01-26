class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user = @user.books
  end
  
  def edit
  end
end
