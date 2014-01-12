class Web::SessionsController < Web::ApplicationController
  def new
    @session = UserSignInType.new
    add_breadcrumb :new, :root_path
  end

  def create
    @session = UserSignInType.new session_params

    if @session.valid?
      sign_in @session.user
      UserMailer.greet_email(@session.user).deliver
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private
  def session_params
    params[:user_sign_in_type]
  end
end
