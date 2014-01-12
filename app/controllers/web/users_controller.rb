class Web::UsersController < Web::ApplicationController
  def new
    @user = User.new
    add_breadcrumb :new, :new_user_path
  end

  def create
    @user = UserEditType.new params[:user]

    if @user.save
      redirect_to posts_path
    else
      render action: "new"
    end
  end

  def show
    @user = User.find params[:id]
    add_breadcrumb :show, @user
  end
end
