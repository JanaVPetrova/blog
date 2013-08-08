class SessionsController < ApplicationController
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new session_params

    if @session.valid?
      sign_in @session.user
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
  def session_params
    params[:user_sign_in_type]
  end
end
