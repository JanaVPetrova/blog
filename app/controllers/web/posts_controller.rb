class Web::PostsController < Web::ApplicationController
  add_breadcrumb :index, :posts_path

  def index
    @search = Post.web.published.search(params[:q])
    @posts = @search.result.page(params[:page]).decorate
  end

  def show
    @post = Post.web.published.find params[:id]
    @comment = Post::Comment.new
    add_breadcrumb :show, @post
  end
end