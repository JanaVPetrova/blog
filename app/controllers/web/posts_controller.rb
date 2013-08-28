class Web::PostsController < Web::ApplicationController
  add_breadcrumb :index, :posts_path

  def index
    @posts = Post.published.page params[:page]
    #add_breadcrumb :index, :posts_path
  end

  def new
    if current_user_owner?
      @post = Post.new
    else
      f(:error)
      redirect_to posts_path
    end
    add_breadcrumb :new, :new_post_path
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

  def show
    @post = Post.published.find params[:id]
    @comment = Post::Comment.new
    add_breadcrumb :show, @post
  end

  def edit
    if current_user_owner?
      @post = Post.find params[:id]
    else
      f(:error)
      redirect_to posts_path
    end
    add_breadcrumb :edit, :edit_post_path
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