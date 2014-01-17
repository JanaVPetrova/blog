class Web::Admin::PostsController < Web::Admin::ApplicationController
  def index
    query = { s: 'title asc' }.merge(params[:q] || {})
    @search = Post.web.search(query)
    @posts = @search.result.page(params[:page]).decorate
  end

  def new
    @post = Post.new
  end

  def create
    @post = PostEditType.new(params[:post])
    @post.changed_by = current_user
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
    @post.changed_by = current_user

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
