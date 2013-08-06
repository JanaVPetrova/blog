require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create :comment
  end

  test "should create comment" do 
    attrs = attributes_for :comment

    assert_difference("Comment.count") do
      post :create, user_id: @comment.post.user, post_id: @comment.post, comment: attrs
    end

    assert_response :redirect
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete :destroy, id: @comment, user_id: @comment.post.user, post_id: @comment.post
    end

    assert_response :redirect
  end
end
