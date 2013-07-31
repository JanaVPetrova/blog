require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @post = create :post
    @comment_params = attributes_for :comment
    @comment_params[:post_id] = @post.id
    @comment = create :comment, @comment_params
  end

  test "should create comment" do 
    attrs = attributes_for :comment

    assert_difference("Comment.count") do
      post :create, post_id: @post, comment: attrs
    end
    
    assert_redirected_to post_path(@post)
  end

  test "should destroy comment" do
    request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials("dhh","secret")

    assert_difference("Comment.count", -1) do
      delete :destroy, id: @comment, post_id: @post
    end

    assert_redirected_to post_path(@post)
  end
end
