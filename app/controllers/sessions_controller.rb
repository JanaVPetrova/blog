class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_login user_params[:login]

    if @user.password == user_params[:password]
      sign_in @user
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to users_path
  end

  private
  def user_params
    params[:user]
  end
end
