class PostsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def index
    @posts = Post.page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text, :state))
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post].permit(:title, :text, :state_event))
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end