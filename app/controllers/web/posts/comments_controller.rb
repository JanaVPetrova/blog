class Web::Posts::CommentsController < Web::Posts::ApplicationController
  def create
    @post = resource_post
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
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

  private
  def comment_params
    #FIXME по-человечески указывать user_id в comment_params
    res = params.require(:post_comment).permit(:body, :parent_id)
    res[:user_id] = current_user.id
    res
  end
end
