class Web::UsersController < Web::ApplicationController
  def index
    @users = User.all.decorate
    add_breadcrumb :index, :users_path
  end

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

  def edit
    @user = User.find params[:id]
    add_breadcrumb :index, :edit_user_path
  end

  def update
    @user = User.find params[:id]
    if current_user == @user
      @user = @user.becomes UserEditType

      if @user.update_attributes params[:user]
        redirect_to user_path(@user)
      else
        redirect_to edit_user_path(@user)
      end
    else
      f(:error)
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
end
