class Web::Admin::PostsController < Web::Admin::ApplicationController
  def index
    @search = Post.web.asc_by_title.search(params[:q])
    @posts = @search.result.page(params[:page]).decorate
  end

  def new
    @post = Post.new
  end

  def create
    @post = PostEditType.new(params[:post])
    if @post.save
      f(:success)
      redirect_to admin_posts_path
    else
      f(:error)
      render 'new'
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post = @post.becomes PostEditType

    if @post.update_attributes params[:post]
      f(:success)
      redirect_to admin_posts_path
    else
      f(:error)
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.mark_as_deleted
    redirect_to admin_posts_path
  end
end
