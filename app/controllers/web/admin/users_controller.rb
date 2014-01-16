class Web::Admin::UsersController < Web::Admin::ApplicationController
  #FIXME
  before_filter :authentificate_admin!

  def index
    @users = User.all
  end

  def update
    @user = User.find params[:id]
    @user = @user.becomes UserEditType

    if @user.update_attributes params[:user]
      f(:success)
    else
      f(:error)
    end
    redirect_to admin_users_path
  end
end
