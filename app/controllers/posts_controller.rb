class PostsController < ApplicationController
  def index
    @posts = Post.page params[:page]
  end

  def new
    if current_user_owner?
      @post = Post.new
    else
      flash[:error] = t('.access_denied')
      redirect_to posts_path
    end
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
    if current_user_owner?
      @post = Post.find params[:id]
    else
      flash[:error] = t('.access_denied')
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes post_params
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    if current_user_owner?
      @post = Post.find(params[:id])
      @post.mark_as_deleted
    else
      flash[:error] = t('.access_denied')
    end
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :state, :validation_state_event)
  end
end