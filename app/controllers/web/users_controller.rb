class Web::UsersController < Web::ApplicationController
  def index
    @users = User.all
    add_breadcrumb :index, :users_path
  end

  def new
    @user = User.new
    add_breadcrumb :new, :new_user_path
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
    add_breadcrumb :show, @user
  end

  def edit
    @user = User.find params[:id]
    add_breadcrumb :index, :edit_user_path
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
    if current_user_owner?
      @user = User.find params[:id]
      @user.destroy
      redirect_to users_path
    else
      f(:error)
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:login, :password)
  end
end
