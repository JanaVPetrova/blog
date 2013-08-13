class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
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
    res = params.require(:comment).permit(:body)
    res[:user_id] = current_user.id
    res
  end
end
