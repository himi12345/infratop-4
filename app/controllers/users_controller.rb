class UsersController < ApplicationController

  #before_action :ensure_current_user, {only: [:edit]}
  #def ensure_current_user
    #if @current_user.id != params[:id].to_i
      #flash[:notice]="権限がありません"
      #redirect_to("/books/index")
    #end
  #end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end


end
