class Web::Posts::CommentsController < Web::Posts::ApplicationController
  def create
    @comment = CommentEditType.new(params[:post_comment])
    @comment.post = resource_post
    @comment.user = current_user
    if @comment.save
      f(:success)
    else
      f(:error)
    end
    redirect_to post_path(resource_post)
  end

  def destroy
    @post = resource_post
    @comment = @post.comments.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
    else
      f(:error)
    end
    redirect_to post_path(@post)
  end
end
