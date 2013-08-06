class PostsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @posts = @user.posts.page params[:page]
  end

  def new
    @user = User.find params[:user_id]
    @post = Post.new
  end

  def create
    @user = User.find params[:user_id]
    @post = @user.posts.build post_params
    if @post.save
      redirect_to user_posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
    @user = @post.user
  end

  def update
    @user = User.find params[:user_id]
    @post = Post.find(params[:id])

    if @post.update_attributes post_params
      redirect_to user_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.mark_as_deleted

    redirect_to user_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :state, :validation_state_event)
  end
end