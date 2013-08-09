class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to posts_path
    else
      render action: "new"
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes user_params
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:login, :password)
  end
end
