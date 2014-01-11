class Web::Admin::PostsController < Web::Admin::ApplicationController
  # FIXME remove if current_user_owner?, add authority
  def index
    if current_user_owner?
      @search = Post.web.published.search(params[:q])
      @posts = @search.result.page(params[:page]).decorate
    else
      f(:error)
      redirect_to posts_path
    end
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
    if current_user_owner?
      @post = PostEditType.new(params[:post])
      if @post.save
        f(:success)
        redirect_to posts_path
      else
        f(:error)
        render 'new'
      end
    else
      f(:error)
      redirect_to posts_path
    end
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
    @post = Post.find params[:id]
    if current_user_owner?
      @post = @post.becomes PostEditType

      if @post.update_attributes params[:post]
        f(:success)
        redirect_to posts_path
      else
        f(:error)
        render 'edit'
      end
    else
      f(:error)
      redirect_to @post
    end
  end

  def destroy
    if current_user_owner?
      @post = Post.published.find(params[:id])
      @post.mark_as_deleted
    else
      f(:error)
    end
    redirect_to posts_path
  end
end
