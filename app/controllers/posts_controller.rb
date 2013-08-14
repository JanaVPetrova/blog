class PostsController < ApplicationController
  def index
    @posts = Post.page params[:page]
  end

  def new
    if current_user_owner?
      @post = Post.new
    else
      f(:error)
      redirect_to posts_path
    end
  end

  def create
    @post = PostEditType.new(params[:post])
    if @post.save
      f(:success)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def edit
    if current_user_owner?
      @post = Post.find params[:id]
    else
      f(:error)
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post = @post.becomes PostEditType

    if @post.update_attributes params[:post]
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
      f(:error)
    end
    redirect_to posts_path
  end
end